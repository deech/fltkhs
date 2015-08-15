{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
module Graphics.UI.FLTK.LowLevel.Ask
  (
    flBeep,
    BeepType(..),
    flMessage,
    flAlert,
    flInput,
    flPassword
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_AskC.h"
import C2HS hiding (cFromEnum, cToBool,cToEnum)
import Foreign.C.Types

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

{# fun flc_input as flInput' { `String' } -> `()' #}
flInput :: String -> IO ()
flInput = flInput'

{# fun flc_password as flPassword' { `String' } -> `()' #}
flPassword :: String -> IO ()
flPassword = flPassword'

{# fun flc_message as flMessage' { `String' } -> `()' #}
flMessage :: String -> IO ()
flMessage = flMessage'

{# fun flc_alert as flAlert' { `String' } -> `()' #}
flAlert :: String -> IO ()
flAlert = flAlert'
