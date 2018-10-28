port module Ports exposing (authStateChanged, signIn, signOut)

import Types exposing (NewUser, User)


port signIn : () -> Cmd msg


port signOut : () -> Cmd msg


port signUp : NewUser -> Cmd msg


port authStateChanged : (Maybe User -> msg) -> Sub msg
