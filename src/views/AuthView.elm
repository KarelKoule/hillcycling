module Views.AuthView exposing (view)

import Auth
import Html exposing (Html, a, button, div, i, img, span, text)
import Html.Attributes exposing (class, height, src, style)
import Html.Events exposing (onClick)
import Msgs exposing (..)
import Ports exposing (..)
import Types exposing (User)


view : Auth.Model -> Html Msg
view model =
    case model.user of
        Just user ->
            div []
                [ img [ class "rounded-circle", height 30, src (Maybe.withDefault "unknown" user.photoURL) ] []
                , text (Maybe.withDefault "unknown" user.displayName)
                , i [ class "fas fa-sign-out-alt", onClick (AuthStep SignOut) ] []
                ]

        Nothing ->
            a [ onClick (AuthStep SignIn), class "btn btn-social btn-google", style "color" "white" ] [ i [ class "fab fa-google" ] [], text "Sign in with Google" ]
