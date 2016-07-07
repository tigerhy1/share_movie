module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg)
import Models exposing (Model(..))
import ShareList exposing (showList)
import ShareAdd exposing (addShare)
import Selector exposing (..)

view : Model -> Html Msg
view model =
    case model of
        ShowListModel list  -> 
            div [] 
                [ ShareList.showList list 
                , showSelector  
                ]
        AddModel item ->
            div []
                [ ShareAdd.addShare item
                , showSelector
                ]
            
             
        
        
