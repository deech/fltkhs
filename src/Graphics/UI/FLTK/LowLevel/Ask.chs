{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
module Graphics.UI.FLTK.LowLevel.Ask
  (
    flBeep,
    BeepType(..),
    flMessage,
    flAlert,
    flChoice,
    flInput,
    flPassword
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_AskC.h"
import C2HS hiding (cFromEnum, cToBool,cToEnum)

import qualified Data.Text as T
import Data.Maybe (fromMaybe, maybe)
import Graphics.UI.FLTK.LowLevel.Utils

#c
enum BeepType {
  BeepDefault = FL_BEEP_DEFAULT,
  BeepMessage = FL_BEEP_MESSAGE,
  BeepError = FL_BEEP_ERROR,
  BeepQuestion = FL_BEEP_QUESTION,
  BeepPassword = FL_BEEP_PASSWORD,
  BeepNotification = FL_BEEP_NOTIFICATION
};
#endc

{#enum BeepType {} deriving (Eq, Show, Ord) #}

{# fun flc_beep as flBeep' {} -> `()' #}
{# fun flc_beep_with_type as flBeepType' { id `CInt' } -> `()' #}
flBeep :: Maybe BeepType -> IO ()
flBeep Nothing = flBeep'
flBeep (Just bt) = flBeepType' (fromIntegral (fromEnum bt))

{# fun flc_input_with_deflt as flInput' { `CString',`CString' } -> `CString' #}
flInput :: T.Text -> Maybe T.Text -> IO (Maybe T.Text)
flInput msg defaultMsg = do
  msgC <- copyTextToCString msg
  let def = fromMaybe T.empty defaultMsg
  defaultC <- copyTextToCString def
  r <- flInput' msgC defaultC
  cStringToMaybeText r

{# fun flc_choice as flChoice' { `CString',`CString',`CString',`CString' } -> `CInt' #}
flChoice :: T.Text -> T.Text -> Maybe T.Text -> Maybe T.Text -> IO Int
flChoice msg b0 b1 b2 = do
  msgC <- copyTextToCString msg
  b0C <- copyTextToCString b0
  let stringOrNull t = maybe (return nullPtr) copyTextToCString t
  b1C <- stringOrNull b1
  b2C <- stringOrNull b2
  r <- flChoice' msgC b0C b1C b2C
  return $ fromIntegral r

{# fun flc_password as flPassword' { `CString' } -> `CString' #}
flPassword :: T.Text -> IO (Maybe T.Text)
flPassword msg = do
  r <- copyTextToCString msg >>= flPassword'
  cStringToMaybeText r

{# fun flc_message as flMessage' { `CString' } -> `()' #}
flMessage :: T.Text -> IO ()
flMessage t = copyTextToCString t >>= flMessage'

{# fun flc_alert as flAlert' { `CString' } -> `()' #}
flAlert :: T.Text -> IO ()
flAlert t = copyTextToCString t >>= flAlert'
