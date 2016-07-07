module Models exposing (..)


type Model =
    ShowListModel (List ShareItem) | AddModel ShareItem

type alias ShareItem = 
    { id : Int 
    , movie_name : String
    , share_comment : String
    }



