module Main exposing (Model, init, main, update, view)

import Auth
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (..)
import Views.AuthView as AuthView
import Views.Modals as Modals
import Views.Navbar as Navbar



---- MODEL ----


type alias Model =
    { authModel : Auth.Model }


init : ( Model, Cmd Msg )
init =
    ( { authModel = Auth.initModel }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map ProcessAuthMsg (Auth.subscriptions model.authModel)
        ]



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProcessAuthMsg authMsg ->
            let
                ( subModel, subCmd ) =
                    Auth.update authMsg model.authModel
            in
            ( { model | authModel = subModel }
            , Cmd.map ProcessAuthMsg subCmd
            )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ Navbar.view model.authModel
        , div
            [ attribute "id" "map"
            , class "container-fluid"
            , attribute "style" "height: 85vh"
            ]
            []
        , div
            [ class "container" ]
            []
        , Modals.signUpDialog
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
