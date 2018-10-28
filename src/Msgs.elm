module Msgs exposing (AuthMsg(..), Msg(..))

import Types


type AuthMsg
    = SignIn
    | SignOut
    | AuthStateChanged (Maybe Types.User)


type SignUpMsg
    = SetFormField Types.SignUpField
    | SignUpNewUser Types.NewUser


type Msg
    = ProcessAuthMsg AuthMsg
    | ProcessSignUp SignUpMsg
