module ShareAdd exposing (..)

import Html exposing (..)
import Html.Attributes exposing (type', name, value, class, id, for, rows)
import Messages exposing (..)
import Models exposing (..)
import Html.Events exposing (onInput, onClick)

addShare : ShareItem -> Html Msg
addShare item = 
    div [ class "p2"  ]
        [ form [] 
            [ div [ class "form-group" ] [
                label [ for "name"] [ text "电影名" ], 
                input [ type' "text", class "form-control",name "name", id "name", onInput ChangeName ] []
              ]
            , div [ class "form-group" ] [
                label [ for "comment"] [ text "推荐理由" ], 
                textarea [ class "form-control", rows 3, name "comment", id "comment", onInput ChangeComment ] []
              ]
            , div [ class "form-group" ] [
                input [ class "btn btn-primary", value "Submit", onClick SubmitAddShare ] []
              ]
            ]
        ] 
