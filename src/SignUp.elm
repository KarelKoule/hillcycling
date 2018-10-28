module SignUp exposing (Model)

import Types exposing (..)


type alias Model =
    { email : String
    , password : String
    }


setField : Model -> SignUpField -> String -> Model
setField model field value =
    case field of
        Email ->
            { model | email = value }

        Password ->
            { model | password = value }
