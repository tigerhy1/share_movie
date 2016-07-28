module ShareAdded exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (ShareItem)
import Messages exposing (..)
import String exposing (append)
import Html.Events exposing (onClick)

shareAdded : Bool -> Html Msg
shareAdded success =
    div [ class "container-fluid"
        , style 
          [ ("padding", "1em 1em 1em 2em")
          ]
        ]
        [ div [] [
            case success of
                False -> h1 [ class "text-center" ] [ text "添加失败" ]
                True -> h1 [ class "text-center" ] [ text "添加成功" ]
            ]
        , button 
            [ class "btn btn-primary m1", onClick ShowList ] 
            [ text "Return"]
        ]