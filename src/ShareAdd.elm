module ShareAdd exposing (..)

import Html exposing (..)
import Html.Attributes exposing (type', name, value, class)
import Messages exposing (..)
import Models exposing (..)
import Html.Events exposing (onInput, onClick)

addShare : ShareItem -> Html Msg
addShare item = 
    div [ class "p2"  ]
        [ text "Hello, In addShare" 
        , div [] [
            input [ type' "text", name "id", onInput ChangeId ] []
          ]
        , div [] [
            input [ type' "text", name "name", onInput ChangeName ] []
          ]
        , div [] [
            input [ type' "text", name "comment", onInput ChangeComment ] []
          ]
        , div [] [
            input [ class "btn white bg-blue", type' "submit", value "Submit", onClick SubmitAddShare ] []
          ]
        ] 
