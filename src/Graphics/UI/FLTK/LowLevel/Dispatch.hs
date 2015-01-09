{-# LANGUAGE GADTs, UndecidableInstances, MultiParamTypeClasses, FunctionalDependencies, FlexibleInstances, FlexibleContexts, ScopedTypeVariables, OverlappingInstances, EmptyDataDecls #-}
module Graphics.UI.FLTK.LowLevel.Dispatch
       (
         FindOp,
         Functions,
         FindInHierarchy,
         Match,
         Op,
         Same,
         Different,
         dispatch,
         runOp,
         castTo,
         Parent
       )
where
import Graphics.UI.FLTK.LowLevel.Fl_Types

-- Type level function where `b` is Same
-- if `x` and `y` are equal and `Different`
-- if not.
data Same
data Different
class TypeEqual x y b | x y -> b
instance TypeEqual a a Same
instance Different ~ b => TypeEqual x y b

-- Move down a nested type hierarchy
-- eg. Tail (w (x (y (z ())))) (x (y (z ())))
class Tail aas as | aas -> as
instance Tail (a as) as
instance (r ~ ()) => Tail () r

-- Test whether a given nested type contains
-- a type
-- eg. Contains (w (x (y (z ())))) (y ()) Same
--     Contains (w (x (y (z ())))) (a ()) Different
class Contains' a b match r | a b match -> r
instance (Tail aas as, Contains as b r) => Contains' aas b Different r
instance (r ~ Same) => Contains' a b Same r

class Contains as a r | as a -> r
instance (TypeEqual (a ()) b match, Contains' (a as) b match r) => Contains (a as) b r
instance Contains () b Different

-- Move down the "object" hierarchy
-- eg. Downcast Rectangle Shape
class Downcast aas as | aas -> as
instance Downcast (a as) as
instance (as ~ Base) => Downcast Base as

-- Find an the first "object" with given
-- associated method in the hierarchy.
data Match a
data NoFunction a
class FindOp' a b c r | a b c -> r
instance (Downcast aas as, FindOp as f r) => FindOp' aas f Different r
instance (r ~ (Match a)) => FindOp' a b Same r

class FindOp a b c | a b -> c
instance (Functions (a as) fs, Contains fs f match, FindOp' (a as) f match r) => FindOp (a as) f r
instance FindOp Base f (NoFunction f)

-- Find the first "object" of the given type
-- in the hierarchy.
data InHierarchy
data NotInHierarchy a b

class FindInHierarchy' orig a b c r | orig a b c -> r
instance (Downcast aas as, FindInHierarchy orig as o r) => FindInHierarchy' orig aas o Different r
instance (r ~ InHierarchy) => FindInHierarchy' orig a b Same r

class FindInHierarchy orig a b c | orig a b -> c
instance (TypeEqual as oos match, FindInHierarchy' orig as oos match r) => FindInHierarchy orig as oos r
instance (r ~ NotInHierarchy orig o) => FindInHierarchy orig Base o r
instance FindInHierarchy orig Base Base InHierarchy

class Parent a b
instance (FindInHierarchy a a b InHierarchy) => Parent a b

-- Associate a "class" with it's member functions
class Functions a b | a -> b

-- Implementations of methods on various types
-- of objects
class Op op obj origObj impl where
  runOp :: op -> origObj -> (Ref obj) -> impl

-- Arbitrarily cast from one thing to another
-- Probably should add some safety here ...
class CastTo a b r where castTo :: Ref a -> Ref r
instance CastTo a b r where castTo (Ref x) = (Ref x)

-- Given some "object" and a "function" dispatch to the
-- right implementation.
dispatch :: forall op obj origObj impl.
            (
              FindOp origObj op (Match obj),
              Op op obj origObj impl
            ) =>
            op -> Ref origObj -> impl
dispatch op refOrig = runOp op (undefined :: origObj) ((castTo refOrig) :: Ref obj)
