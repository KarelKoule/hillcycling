module Views.AuthView exposing (view)

import Auth
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msgs exposing (..)
import Types exposing (User)


view : Auth.Model -> Html Msg
view model =
    div
        [ class "dropdown"
        ]
        [ span
            [ class "dropdown-toggle"
            , attribute "id" "auth-form-toggle"
            , attribute "data-toggle" "dropdown"
            , attribute "aria-haspopup" "true"
            , attribute "aria-expanded" "false"
            ]
            [ case model.user of
                Just user ->
                    profileAvatar user

                Nothing ->
                    signInButton
            ]
        , div
            [ class "dropdown-menu dropdown-menu-right p-4"
            , attribute "aria-labelledby" "auth-form-toggle"
            ]
            [ case model.user of
                Just user ->
                    profile user

                Nothing ->
                    signInForm
            ]
        ]


signInButton : Html Msg
signInButton =
    button
        [ class "btn btn-primary"
        ]
        [ text "Sign In" ]


profileAvatar : User -> Html Msg
profileAvatar user =
    img
        [ class "rounded-circle m-0"
        , height 30
        , src (Maybe.withDefault "unknown" user.photoURL)
        ]
        []


signUpButton : Html Msg
signUpButton =
    button [ class "btn btn-primary", type_ "button", onClick (AuthStep SignOut) ]
        [ text "Sign Up"
        ]


profile : User -> Html Msg
profile user =
    div
        []
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
            []
            [ text (Maybe.withDefault "unknown" user.displayName)
            , i
                [ class "fas fa-sign-out-alt ml-sm-2"
                , onClick (AuthStep SignOut)
                ]
                []
            ]
        ]


signInForm : Html Msg
signInForm =
    div []
        [ a
            [ onClick (AuthStep SignIn)
            , class "btn btn-social btn-google"
            , style "color" "white"
            ]
            [ i [ class "fab fa-google" ] []
            , text "Sign in with Google"
            ]
        , div [ class "dropdown-divider" ] []
        , input [ type_ "text", placeholder "Email address" ] []
        , input [ type_ "password", placeholder "Password" ] []
        , a
            [ href "#"
            , attribute "data-toggle" "modal"
            , attribute "data-target" "#signUpDialog"
            ]
            [ text "Have not an account yet?" ]
        ]
