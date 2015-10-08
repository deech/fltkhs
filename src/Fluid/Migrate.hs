module Fluid.Migrate where
import Numeric
import Graphics.UI.FLTK.LowLevel.Utils
import Fluid.Types
import Fluid.Lookup
import Foreign.C.Types
import Data.List
import Data.Ord

-- Generate Haskell from an existing C++ Fluid file.
-- Tabling this for now.
addOffsets :: Path -> [a] -> [(Path,a)]
addOffsets pathSoFar =
  zip ((map ((++) pathSoFar) . (drop 1) . inits) (repeat D))

indexTree
  :: PathIndexedElements -> Path -> WidgetTree -> PathIndexedElements
indexTree accum pathSoFar wt =
  let newPath = pathSoFar ++ [I]
      addCurrent =
        (\e ->
           accum ++ [(newPath,(WidgetElement e))])
  in case wt of
       c@(Container _ _ _ innerWts) ->
         addCurrent c ++
         (concatMap (\(p,wt) -> indexTree [] p wt)
                    (addOffsets newPath innerWts))
       c@(Component _ _ _) -> addCurrent c
       _ -> accum

indexBlock
  :: PathIndexedElements -> Path -> FluidBlock -> PathIndexedElements
indexBlock accum pathSoFar fb =
  let newPath = pathSoFar ++ [I]
      addCurrent =
        (\e ->
           accum ++ [(newPath,(BlockElement e))])
  in case fb of
       c@(FluidClass (Class _ _ fbs)) ->
         addCurrent c ++ concatMap (indexBlock [] newPath) fbs
       f@(FluidFunction (Function _ _ _ wts)) ->
         addCurrent f ++ (concatMap (indexTree [] newPath) wts)
       _ -> accum

indexByPaths :: Fluid -> PathIndexedElements
indexByPaths fbs =
  concatMap (\(p,fb) -> indexBlock [] p fb)
            (addOffsets [] fbs)

replaceV :: (Eq a)
         => a -> b -> [(a,[b])] -> [(a,[b])]
replaceV k newV kvs =
  let (newKvs,found) =
        foldl (\(accum,found) (_k,_v) ->
                 if (_k == k)
                    then (accum ++ [(_k,_v ++ [newV])],True)
                    else (accum ++ [(_k,_v)],False))
              ([],False)
              kvs
  in if found
        then newKvs
        else newKvs ++ [(k,[newV])]

labelFromAttrs :: [Attribute] -> Maybe String
labelFromAttrs attrs =
  case (filter (\a ->
                  case a of
                    Label l -> True
                    _ -> False)
               attrs) of
    [] -> Nothing
    ((Label (UnbrokenString _l)):_) -> Just _l
    _ -> Nothing

elementName :: FluidElement -> HaskellIdentifier
elementName (BlockElement (FluidClass (Class n _ _))) = n
elementName (BlockElement (FluidFunction (Function n _ _ _))) = n
elementName (WidgetElement (Container _ n _ _)) = n
elementName (WidgetElement (Component _ n _)) = n
elementName _ = Unidentified

elementClass :: FluidElement -> Maybe Type
elementClass (BlockElement (FluidClass (Class _ _ _))) = Just "Class"
elementClass (BlockElement (FluidFunction (Function _ _ _ _))) = Just "Function"
elementClass (WidgetElement (Container t _ _ _)) = Just t
elementClass (WidgetElement (Component t _ _)) = Just t
elementClass _ = Nothing

elementLabel :: FluidElement -> Maybe String
elementLabel (BlockElement (FluidClass (Class n _ _))) = Nothing
elementLabel (BlockElement (FluidFunction (Function n _ _ _))) = Nothing
elementLabel (WidgetElement (Container _ _ attrs _)) = labelFromAttrs attrs
elementLabel (WidgetElement (Component _ _ attrs)) = labelFromAttrs attrs
elementLabel _ = Nothing

makeLookupTables
  :: PathIndexedElements
  -> LookupTables
makeLookupTables pathIndexed =
  let nameIndexed =
        map (\(p,e) -> (p,elementName e)) pathIndexed
      classIndexed =
        map (\(p,e) -> (p,elementClass e)) pathIndexed
      labelIndexed =
        map (\(p,e) -> (p,elementLabel e)) pathIndexed
      buildTable :: Eq a
                 => [(Path,a)] -> [(a,[Path])]
      buildTable =
        foldl (\accum (p,n) -> replaceV n p accum) []
  in (buildTable nameIndexed,buildTable classIndexed,buildTable labelIndexed)

lookupPaths
  :: Eq a
  => a -> [(a,[Path])] -> NameLookupResult
lookupPaths i indexedPaths =
  case (lookup i indexedPaths) of
    Nothing -> PathNotFound
    Just (_p:[]) -> FoundUniquePath _p
    Just ps@(_p:_ps) -> FoundMultiplePaths ps
    Just [] -> PathNotFound

uniqueNames :: Fluid -> IdentifierIndexedElements
uniqueNames fluidBlocks =
  let pathIndexed = indexByPaths fluidBlocks
      (idIndexed,classIndexed,labelIndexed) = makeLookupTables pathIndexed
      pathsInside path =
        filter (isPrefixOf path)
               (map fst pathIndexed)
      generateId =
        go pathIndexed idIndexed
  in undefined
  where go :: PathIndexedElements
           -> [(HaskellIdentifier,[Path])]
           -> PathIndexedElements
           -> IdentifierIndexedElements
           -> IdentifierIndexedElements
        go pathTable haskellIdTable [] accum = accum
        go pathTable haskellIdTable ((path,element):restOfElements) accum =
          let name = elementName element
              occurences =
                lookup name haskellIdTable
          in case occurences of
               Just (_:[]) ->
                 go pathTable
                    haskellIdTable
                    restOfElements
                    (accum ++ [([ElementName name],element)])
               Just paths ->
                 let withoutThisPath =
                       filter ((/=) path) paths
                     parentPath =
                       reverse . dropWhile ((==) D) . drop 1 . reverse
                     closestOccurencesAbove =
                       reverse (sortBy (comparing length)
                                       (filter (\p ->
                                                  let currParent = parentPath p
                                                  in (length currParent <
                                                      length (parentPath path)) &&
                                                     (currParent `isPrefixOf`
                                                      (parentPath path)))
                                               withoutThisPath))
                 in case closestOccurencesAbove of
                      [] -> undefined
                      _ -> undefined
               Nothing ->
                 go pathTable
                    haskellIdTable
                    restOfElements
                    (accum ++ [([ElementPath path],element)])
