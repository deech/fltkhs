module Types (
   WidgetTree(..),
   FunctionArgs(..),
   Function(..),
   Class(..),
   Attribute(..),
   Fluid,
   FluidBlock(..),
   UnbrokenOrBraced(..),
   BracedStringParts(..),
   HaskellIdentifier(..),
   ModuleIdentifier(..),
   PathElem(..),
   Path,
   PathIndexedElements,
   FluidElement(..),
   Name,
   NameLookupResult(..),
   ElementIdentifier(..),
   IdentifierIndexedElements,
   Type,
   LookupTables,
   GenerationError(..),
   TakenNames(..)
 ) where

type Name = Maybe String
data Attribute
  = Code0 [BracedStringParts]
  | Code1 [BracedStringParts]
  | Code2 [BracedStringParts]
  | Code3 [BracedStringParts]
  | Label UnbrokenOrBraced
  | Callback UnbrokenOrBraced
  | XYWH (Int,Int,Int,Int)
  | Color Int
  | Maximum Int
  | Value UnbrokenOrBraced
  | Box String
  | Labelsize Int
  | Resizable
  | Visible
  | Align Int
  | Minimum Int
  | Step Double
  | SelectionColor Int
  | Labeltype String
  | Labelcolor Int
  | Labelfont Int
  | Open
  | Hide
  | ReturnType UnbrokenOrBraced
  | Shortcut String
  | Private
  | UserData UnbrokenOrBraced
  | UserDataType UnbrokenOrBraced
  | Tooltip UnbrokenOrBraced
  | Comment UnbrokenOrBraced
  | Inherits String
  | When Int
  | Hotspot
  | Modal
  | Selected
  | Local
  | Public
  | TextFont Int
  | TextSize Int
  | TextColor Int
  | SliderSize Double
  | WidgetType UnbrokenOrBraced
  | Deactivate
  | InSource
  | InHeader
  | Global
  | DownBox String
  | SizeRange (Int,Int,Int,Int)
  | LineComment String
  | AfterCode UnbrokenOrBraced
  | DerivedFromClass String
  | Filename UnbrokenOrBraced
  | Divider
  | Image UnbrokenOrBraced
  | Deimage UnbrokenOrBraced
  deriving (Show)
type Type = String
data WidgetTree = Group Type HaskellIdentifier [Attribute] [WidgetTree]
                | Menu Type HaskellIdentifier [Attribute] [WidgetTree]
                | Component Type HaskellIdentifier [Attribute]
                | Code [Attribute] UnbrokenOrBraced
                | StandAloneComment [Attribute] UnbrokenOrBraced
                | CodeBlock UnbrokenOrBraced [Attribute] [WidgetTree]
                | Version String
  deriving Show

newtype FunctionArgs =
  FunctionArgs (Maybe String)
  deriving (Show)
data Function =
  Function HaskellIdentifier
           FunctionArgs
           [Attribute]
           [WidgetTree]
  deriving (Show)
data Class =
  Class HaskellIdentifier
        [Attribute]
        [FluidBlock]
  deriving (Show)
data FluidBlock
  = FluidClass Class
  | FluidFunction Function
  | DeclBlock [Attribute]
              UnbrokenOrBraced
              [FluidBlock]
  | Decl [Attribute]
         UnbrokenOrBraced
  | Data String
         [Attribute]
  deriving (Show)

data UnbrokenOrBraced
  = UnbrokenString String
  | BracedString [BracedStringParts]
  deriving (Show)

data BracedStringParts
  = BareString String
  | QuotedCharCode String
  | QuotedHex Integer
  | QuotedOctal Integer
  | QuotedChar String
  | NestedBrace [BracedStringParts]
  deriving (Show)

type Fluid = [FluidBlock]

data FluidElement
  = BlockElement FluidBlock
  | WidgetElement WidgetTree
data HaskellIdentifier
  = ValidHaskell String
  | InvalidHaskell String
  | UnidentifiedFunction
  | Unidentified
  deriving (Eq,Show)

data ModuleIdentifier
  = ValidModule String
  | InvalidModule String

data PathElem
  = D
  | I
  deriving (Show,Eq)
data NameLookupResult
  = FoundUniquePath Path
  | FoundMultiplePaths [Path]
  | PathNotFound

type Path = [PathElem]
data ElementIdentifier
  = ElementPath Path
  | ElementName HaskellIdentifier
  | ElementType Type

type PathIndexedElements = [(Path,FluidElement)]
type IdentifierIndexedElements = [([ElementIdentifier], FluidElement)]
type LookupTables = ([(HaskellIdentifier,[Path])],[(Maybe Type,[Path])],[(Maybe String,[Path])])
data GenerationError = BadModuleName String
newtype TakenNames = TakenNames [String] deriving Show
