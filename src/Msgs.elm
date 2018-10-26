module Msgs exposing (AuthMsg(..), Msg(..))

import Types


type AuthMsg
    = SignIn
    | SignOut
    | AuthStateChanged (Maybe Types.User)


type Msg
    = AuthStep AuthMsg
