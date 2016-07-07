module Selector exposing (..)

import Html exposing (..)
import Messages exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

showSelector : Html Msg
showSelector =
    div []
        [ button 
              [ class "btn btn-default m1", onClick ShowList ] 
              [ text "Show"]
        , button 
              [ class "btn white bg-blue m1", onClick AddShare ] 
              [ text "Add"]
        ]  

