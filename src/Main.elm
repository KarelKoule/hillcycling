module Main exposing (Model, init, main, update, view)

import Auth
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (..)
import Views.AuthView as AuthView



---- MODEL ----


type alias Model =
    { authModel : Auth.Model }


init : ( Model, Cmd Msg )
init =
    ( { authModel = Auth.initModel }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map AuthStep (Auth.subscriptions model.authModel)
        ]



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AuthStep authMsg ->
            let
                ( subModel, subCmd ) =
                    Auth.update authMsg model.authModel
            in
            ( { model | authModel = subModel }
            , Cmd.map AuthStep subCmd
            )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ nav [ class "navbar navbar-light bg-light" ]
            [ a [ class "navbar-brand" ] [ text "Hill Cycling" ]
            , div [] [ AuthView.view model.authModel ]
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
