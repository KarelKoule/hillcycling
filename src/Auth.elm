module Auth exposing
    ( Model
    , Msg
    , initModel
    , subscriptions
    , update
    , view
    )

import Html exposing (Html, a, button, div, i, img, span, text)
import Html.Attributes exposing (class, height, src, style)
import Html.Events exposing (onClick)
import Ports exposing (..)
import Types exposing (User)


type alias Model =
    { user : Maybe User
    }


initModel : Model
initModel =
    { user = Nothing }


type Msg
    = SignIn
    | SignOut
    | AuthStateChanged (Maybe User)


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ authStateChanged AuthStateChanged ]


update : Msg -> Model -> ( Model, Cmd Msg )
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


view : Model -> Html Msg
view model =
    case model.user of
        Just user ->
            div [] [ img [ class "rounded-circle", height 30, src (Maybe.withDefault "unknown" user.photoURL) ] [], text (Maybe.withDefault "unknown" user.displayName), i [ class "fas fa-sign-out-alt", onClick SignOut ] [] ]

        Nothing ->
            a [ onClick SignIn, class "btn btn-social btn-google", style "color" "white" ] [ i [ class "fab fa-google" ] [], text "Sign in with Google" ]
