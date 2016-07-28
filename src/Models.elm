module Models exposing (..)


type Model =
    ShowListModel (List ShareItem) | AddModel ShareItem | Added Bool

type alias ShareItem = 
    { id : Int 
    , user_name : String
    , movie_name : String
    , share_comment : String
    }



