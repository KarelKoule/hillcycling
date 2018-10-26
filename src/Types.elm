module Types exposing (User)


type alias UserId =
    String


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
