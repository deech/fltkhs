module Utils (collapseParts, collapseString) where
import Types
import Numeric

collapseParts :: [BracedStringParts] -> String
collapseParts parts = go parts []
  where go ((BareString s):_parts) accum =
          go _parts (accum ++ s)
        go ((QuotedCharCode c):_parts) accum =
          go _parts (accum ++ "\\" ++ [c])
        go ((QuotedHex h):_parts) accum =
          go _parts (accum ++ "0x" ++ (showHex h ""))
        go ((QuotedOctal o):_parts) accum =
          go _parts (accum ++ "0o" ++ (showOct o ""))
        go ((QuotedChar c):_parts) accum =
          go _parts (accum ++ c)
        go ((NestedBrace ps):_parts) accum =
          go _parts ("{" ++ (go ps accum) ++ "}")
        go [] accum = accum

collapseString :: UnbrokenOrBraced -> String
collapseString (UnbrokenString s) = s
collapseString (BracedString []) = ""
collapseString (BracedString parts) = collapseParts parts
