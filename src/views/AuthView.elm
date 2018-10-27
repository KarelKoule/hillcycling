module Views.AuthView exposing (view)

import Auth
import Html exposing (Html, a, button, div, i, img, span, text)
import Html.Attributes exposing (attribute, class, height, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (..)
import Types exposing (User)


view : Auth.Model -> Html Msg
view model =
    div
        [ attribute "id" "auth-form"
        , attribute "data-toggle" "popover"
        , attribute "data-container" "body"
        , attribute "data-placement" "bottom"
        , attribute "data-html" "true"
        ]
        [ case model.user of
            Just user ->
                div []
                    [ a
                        []
                        [ img
                            [ class "rounded-circle"
                            , height 30
                            , src (Maybe.withDefault "unknown" user.photoURL)
                            ]
                            []
                        ]
                    , div
                        [ class "hide"
                        ]
                        [ text (Maybe.withDefault "unknown" user.displayName)
                        , i
                            [ class "fas fa-sign-out-alt ml-sm-2"
                            , onClick (AuthStep SignOut)
                            ]
                            []
                        ]
                    ]

            Nothing ->
                a
                    [ onClick (AuthStep SignIn)
                    , class "btn btn-social btn-google"
                    , style "color" "white"
                    ]
                    [ i [ class "fab fa-google" ] []
                    , text "Sign in with Google"
                    ]
        , div [ attribute "id" "popover-content-auth-form", class "d-none" ]
            []
        ]
