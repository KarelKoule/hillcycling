module Views.Navbar exposing (view)

import Auth
import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (..)
import Views.AuthView as AuthView


view : Auth.Model -> Html Msg
view model =
    nav [ class "navbar navbar-expand-lg navbar-light bg-light" ]
        [ a
            [ class "navbar-brand"
            ]
            [ text "Hill Cycling" ]
        , button
            [ class "navbar-toggler"
            , type_ "button"
            , attribute "data-toggle" "collapse"
            , attribute "data-target" "#navbarSupportedContent"
            , attribute "aria-controls" "navbarSupportedContent"
            , attribute "aria-expanded" "false"
            , attribute "aria-label" "Toggle navigation"
            ]
            [ span [ class "navbar-toggler-icon" ] []
            ]
        , div
            [ class "collapse navbar-collapse"
            , id "navbarSupportedContent"
            ]
            [ div [ class "navbar-nav ml-auto" ] [ AuthView.view model ] ]
        ]
