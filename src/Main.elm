module Main exposing (Model, Msg(..), init, main, update, view)

import Auth
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)



---- MODEL ----


type alias Model =
    { authModel : Auth.Model }


init : ( Model, Cmd Msg )
init =
    ( { authModel = Auth.initModel }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map AuthMsg (Auth.subscriptions model.authModel)
        ]



---- UPDATE ----


type Msg
    = AuthMsg Auth.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AuthMsg authMsg ->
            let
                ( subModel, subCmd ) =
                    Auth.update authMsg model.authModel
            in
            ( { model | authModel = subModel }
            , Cmd.map AuthMsg subCmd
            )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ nav [ class "navbar navbar-light bg-light" ]
            [ a [ class "navbar-brand" ] [ text "Hill Cycling" ]
            , div [] [ Auth.view model.authModel |> Html.map AuthMsg ]
            ]
        , div
            [ class "jumboton" ]
            [ img [ src "/logo.svg" ] []
            , h1 [] [ text "Your Elm App is working!" ]
            ]
        , div
            [ class "container" ]
            []
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = subscriptions
        }
