module ShareList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (ShareItem)
import Messages exposing (..)
import String exposing (append)

showList : List ShareItem -> Html Msg
showList items =
    div [ class "p2" ]
        (List.map shareItemRow items)

shareItemRow : ShareItem -> Html Msg
shareItemRow item =
    div [ class "well"] 
        [ span [] [ text (append item.user_name "推荐了: ") ], 
          span [ style
                 [("font-weight", "bold")
                 ]
               ] 
               [ text item.movie_name ],
          {--
          span [ style 
                    [ ("font-size", "0.5em"), 
                      ("text-align", "right")
                    ]
               ]
               [ text "@2016-07-08 11:18"
               ],
          --}
          p [ style 
              [ ("padding", "1em 1em 1em 2em")
              ]
            ]
            [ text item.share_comment ],
          p [ style 
                    [ 
                      ("font-style", "oblique")
                    ]
               ]
               [ text "@2016-07-08 11:18"
               ]
        ]
