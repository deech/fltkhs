{-# LANGUAGE KindSignatures, TypeFamilies, DataKinds, UndecidableInstances, MultiParamTypeClasses, FunctionalDependencies, FlexibleInstances, FlexibleContexts, ScopedTypeVariables, EmptyDataDecls, CPP #-}
#ifndef OVERLAPPING_INSTANCES_DEPRECATED
{-# LANGUAGE OverlappingInstances #-}
#endif
module Graphics.UI.FLTK.LowLevel.Dispatch
       (
         -- * FindOp
         FindOp,
         -- * Functions
         Functions,
         -- * Match
         Match,
         -- * NoFunction
         NoFunction,
         -- * Op
         Op,
         -- * dispatch
         dispatch,
         -- * runOp
         runOp,
         -- * castTo
         castTo,
         -- * safeCast
         safeCast,
         -- * Parent
         Parent
       )
where
import Graphics.UI.FLTK.LowLevel.Fl_Types

-- Type level function where `b` is Same
-- if `x` and `y` are equal and `Different`
-- if not.
data Same
data Different

-- | See 'FindOp' for more details.
data Match a
-- | See 'FindOp' for more details.
data NoFunction a

-- Test whether a given nested type contains
-- a type
-- eg. Same ~ Contains (w (x (y (z ())))) (y ())
--     Different ~ Contains (w (x (y (z ())))) (a ())
type family Contains as a where
  Contains (a as) (a ()) = Same
  Contains () x = Different
  Contains (a as) b = Contains as b

-- | @FindOp@ searches a class hierarchy for a member function (an  Op-eration)
-- and returns the first class in the hierarchy that support it.
--
-- Given a class hierarchy starting at @a@ and member function @b@ find @c@, the
-- closest ancestor to @a@ (possibly @a@) that has that function.
--
-- If found @r@ is @Match c@, if not found @r@ is @NoFunction b@.
type family FindOpHelper hierarchy  (needle :: *) (found :: *) :: * where
  FindOpHelper hierarchy needle Same = Match hierarchy
  FindOpHelper (child ancestors) needle Different = FindOp ancestors needle

type family FindOp hierarchy (needle :: *) :: * where
  FindOp () n = NoFunction n
  FindOp hierarchy needle = FindOpHelper hierarchy needle (Contains (Functions hierarchy) needle)

-- | Find the first "object" of the given type
-- | in the hierarchy.
data InHierarchy
data NotInHierarchy a b

-- | Move down the "object" hierarchy
-- | eg. Downcast Rectangle Shape
class Downcast aas as | aas -> as
instance Downcast (a as) as
instance (as ~ Base) => Downcast Base as

class TypeEqual x y b | x y -> b
instance
#ifdef OVERLAPPING_INSTANCES_DEPRECATED
  {-# OVERLAPPING #-}
#endif
  TypeEqual a a Same
instance
#ifdef OVERLAPPING_INSTANCES_DEPRECATED
  {-# OVERLAPPABLE #-}
#endif
  Different ~ b => TypeEqual x y b

class FindInHierarchy' orig a b c r | orig a b c -> r
instance (Downcast aas as, FindInHierarchy orig as o r) => FindInHierarchy' orig aas o Different r
instance (r ~ InHierarchy) => FindInHierarchy' orig a b Same r

class FindInHierarchy orig a b c | orig a b -> c
instance (TypeEqual as oos match, FindInHierarchy' orig as oos match r) => FindInHierarchy orig as oos r
instance (r ~ NotInHierarchy orig o) => FindInHierarchy orig Base o r
instance FindInHierarchy orig Base Base InHierarchy


-- | A class with a single instance that is found only if @b@ is an ancestor of @a@.
--
-- Used by some 'Op' implementations to enforce that certain parameters have to be
-- at least a @b@.
class Parent a b
instance (FindInHierarchy a a b InHierarchy) => Parent a b

-- | Associate a "class" with it's member functions
type family Functions (x :: *) :: *

-- | Implementations of methods on various types
--  of objects.
--
--     * @op@ - name of the function
--     * @obj@ - the class that implements @op@
--     * @origObj@ - the class in the hierarchy where the search for @op@ started.
--       Kept around in case the type in needed. The best example is `setCallback`
--       whose implementation is usually found much lower in the hierarchy but where
--       we also want to enforce that the implementation take the type of the widget calling
--       it.
--     * @impl@ - a function that takes the a 'Ref' @origobj@, casted down to 'Ref' @obj@ and
-- whatever other parameters the instance specifies.
class Op op obj origObj impl where
  runOp :: op -> origObj -> (Ref obj) -> impl

-- | Cast any reference to any other reference. Unsafe, intended to be used by 'Op'.
castTo :: Ref a -> Ref r
castTo (Ref x) = (Ref x)

-- | Cast any reference to one of its ancestors.
safeCast :: (Parent a r) => Ref a -> Ref r
safeCast (Ref x) = (Ref x)

-- | Given some member function @op@ and a 'Ref' to some class @origObj@ return
-- the implementation of @op@. See 'Op' for more details.
--
-- Every FLTK function called on some 'Ref' uses this function to figure out
-- what arguments it needs.
dispatch :: forall op obj origObj impl.
            (
              Match obj ~ FindOp origObj op,
              Op op obj origObj impl
            ) =>
            op -> Ref origObj -> impl
dispatch op refOrig = runOp op (undefined :: origObj) ((castTo refOrig) :: Ref obj)
