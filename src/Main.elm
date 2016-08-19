module Main exposing (..)

import Html.App
import Messages exposing (Msg)
import Models exposing (..)
import View exposing (view)
import Update exposing (update)
import ShareList exposing (..)
import Commands exposing (fetchAll)


init : ( Model, Cmd Msg )
init =
    (ShowListModel
         { list = [ ShareItem 1 "a" "b" "d"
                  , ShareItem 2 "c" "d" "d"
                  ]
         , start = 1
         , end = 2
         } 
     , fetchAll 0 20)
 

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- MAIN


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

