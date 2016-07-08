module ShareList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (ShareItem)
import Messages exposing (..)

showList : List ShareItem -> Html Msg
showList items =
    div [ class "p2" ]
        (List.map shareItemRow items)

shareItemRow : ShareItem -> Html Msg
shareItemRow item =
    div [ class "well"] 
        [ text item.movie_name ]
