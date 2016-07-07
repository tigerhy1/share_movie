module ShareList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (ShareItem)
import Messages exposing (..)

showList : List ShareItem -> Html Msg
showList items =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "电影" ]
                    , th [] [ text "推荐原因" ]
                    ]
                ]
            , tbody [] (List.map shareItemRow items)
            ]
        ]

shareItemRow : ShareItem -> Html Msg
shareItemRow item =
    tr []
        [ td [] [ text item.movie_name] 
        , td [] [ text item.share_comment ]
        ]
