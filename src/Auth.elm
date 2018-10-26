module Auth exposing
    ( Model
    , initModel
    , subscriptions
    , update
    )

import Msgs exposing (..)
import Ports exposing (..)
import Types exposing (User)


type alias Model =
    { user : Maybe User
    }


initModel : Model
initModel =
    { user = Nothing }


subscriptions : Model -> Sub AuthMsg
subscriptions _ =
    Sub.batch
        [ authStateChanged AuthStateChanged ]


update : AuthMsg -> Model -> ( Model, Cmd AuthMsg )
update msg model =
    case msg of
        SignIn ->
            ( model, signIn () )

        SignOut ->
            ( model, signOut () )

        AuthStateChanged (Just user) ->
            ( { model | user = Just user }, Cmd.none )

        AuthStateChanged Nothing ->
            ( { model | user = Nothing }, Cmd.none )
