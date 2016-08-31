module LoadMore exposing (..)

import Html exposing (..)
import Messages exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

loadMore : Html Msg
loadMore =
    div []
        [ button 
              [ class "btn m1", onClick ShowListMore ] 
              [ text "LoadMore"]
        ]