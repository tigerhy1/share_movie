module Models exposing (..)


type Model =
    ShowListModel ShowListData | AddModel ShareItem | Added Bool

type alias ShareItem = 
    { id : Int 
    , user_name : String
    , movie_name : String
    , share_comment : String
    }

type alias ShowListData =
    { list : List ShareItem
    , start : Int
    , end : Int
    }



