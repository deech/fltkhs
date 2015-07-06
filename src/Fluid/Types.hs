module Fluid.Types
 (
   WidgetTree(..),
   Function(..),
   Class(..),
   Attribute(..),
   FluidBlock(..),
   Fluid(..),
   UnbrokenOrBraced(..),
   BracedStringParts(..)
 )
where

type Name = Maybe String
data Attribute =
  Code0 [BracedStringParts]
  | Code1 [BracedStringParts]
  | Code2 [BracedStringParts]
  | Code3 [BracedStringParts]
  | Label UnbrokenOrBraced
  | Callback UnbrokenOrBraced
  | XYWH (Int, Int, Int, Int)
  | Type UnbrokenOrBraced
  | Color Int
  | Maximum Int
  | Value UnbrokenOrBraced
  | Box UnbrokenOrBraced
  | Labelsize Int
  | Resizable
  | Visible
  | Align Int
  | Minimum Int
  | Step Double
  | SelectionColor Int
  | Labeltype UnbrokenOrBraced
  | Labelcolor Int
  | Labelfont Int
  | Open
  | Hide
  | ReturnType UnbrokenOrBraced
  | Shortcut UnbrokenOrBraced
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
  | DownBox UnbrokenOrBraced
  | SizeRange (Int, Int, Int, Int)
  | LineComment String
  | AfterCode UnbrokenOrBraced
  | DerivedFromClass String
  | Filename UnbrokenOrBraced
  deriving Show
type Type = String

data WidgetTree =
  Container Type Name [Attribute] [WidgetTree]
  | Component Type Name [Attribute]
  | Code [Attribute] UnbrokenOrBraced
  | StandAloneComment [Attribute] UnbrokenOrBraced
  | CodeBlock UnbrokenOrBraced [Attribute] [WidgetTree]
  | Version String
  deriving Show

data Function = Function Name [Attribute] [WidgetTree] deriving Show
data Class = Class String [Attribute] [FluidBlock] deriving Show
data FluidBlock =
  FluidClass Class
  | FluidFunction Function
  | DeclBlock [Attribute] UnbrokenOrBraced [FluidBlock]
  | Decl [Attribute] UnbrokenOrBraced
  | Data String [Attribute]
  deriving Show
data UnbrokenOrBraced = UnbrokenString String | BracedString [BracedStringParts] deriving Show
data BracedStringParts =
  BareString String
  | QuotedCharCode Char
  | QuotedHex Integer
  | QuotedOctal Integer
  | QuotedChar String
  | NestedBrace [BracedStringParts]
  deriving Show
type Fluid = [FluidBlock]
