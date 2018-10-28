module Views.Modals exposing (signUpDialog)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msgs exposing (..)


signUpDialog : Html Msg
signUpDialog =
    div
        [ class "modal fade"
        , id "signUpDialog"
        , attribute "role" "dialog"
        , attribute "aria-hidden" "true"
        , attribute "tabindex" "-1"
        ]
        [ div [ class "modal-dialog", attribute "role" "document" ]
            [ div [ class "modal-content" ]
                [ div [ class "modal-header" ]
                    [ h5 [ class "modal-title" ] [ text "Sign Up" ]
                    , button [ class "close", attribute "data-dismiss" "modal", attribute "aria-label" "Close" ]
                        [ span [ attribute "aria-hidden" "true" ] [ text "x" ] ]
                    ]
                , div [ class "modal-body" ] [ text "body" ]
                , div [ class "modal-footer" ]
                    [ button
                        [ class "btn btn-secondary", attribute "data-dismiss" "modal" ]
                        [ text "Close" ]
                    , button
                        [ class "btn btn-primary" ]
                        [ text "Sign Up" ]
                    ]
                ]
            ]
        ]
