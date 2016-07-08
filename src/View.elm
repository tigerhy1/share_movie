module View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Models exposing (Model(..))
import ShareList exposing (showList)
import ShareAdd exposing (addShare)
import Selector exposing (..)

view : Model -> Html Msg
view model =
    case model of
        ShowListModel list  -> 
            div[ class "container-fluid"]
               [
                div [ class "col-md-2 col-xs-1"]
                    [],
                div [ class "col-md-8 col-xs-10"] 
                    [ ShareList.showList list 
                    , showSelector  
                    ],
                div [ class "col-md-2 col-xs-1"]
                    []
               ]
        AddModel item ->
            div []
                [ ShareAdd.addShare item
                , showSelector
                ]
            
             
        
        
