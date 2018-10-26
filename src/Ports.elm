port module Ports exposing (authStateChanged, signIn, signOut)

import Types exposing (User)


port signIn : () -> Cmd msg


port signOut : () -> Cmd msg


port authStateChanged : (Maybe User -> msg) -> Sub msg
