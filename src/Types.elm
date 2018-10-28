module Types exposing (NewUser, SignUpField(..), User, UserId, UserInfo)


type alias UserId =
    String


type SignUpField
    = Email
    | Password


type alias NewUser =
    { email : String
    , password : String
    }


type alias UserInfo =
    { displayName : Maybe String
    , email : Maybe String
    , photoURL : Maybe String
    , providerId : String
    , uid : UserId
    }


type alias User =
    { displayName : Maybe String
    , email : Maybe String
    , photoURL : Maybe String
    , providerId : String
    , uid : UserId
    , providerData : List UserInfo
    , emailVerified : Bool
    , isAnonymous : Bool
    , refreshToken : String
    }
