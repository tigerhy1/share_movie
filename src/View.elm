module View exposing (..)

import Html exposing (Html, div, text, button, h1)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Models exposing (Model(..))
import ShareList exposing (showList)
import ShareAdd exposing (addShare)
import ShareAdded exposing (shareAdded)
import Selector exposing (..)
import Html.Events exposing (onClick)

view : Model -> Html Msg
view model =
    case model of
        ShowListModel list  -> 
            div[ class "container-fluid"]
               [ div [ class "row m1" ] []
                {--
                div [ class "col-md-2 col-xs-1"]
                    [],
                --}
               , div [ class "m1"] 
                    [ ShareList.showList list 
                    , showSelector  
                    ]
                {--
                div [ class "col-md-2 col-xs-1"]
                    []
                --}
               ]
        AddModel item ->
            div [ class "container-fluid" ]
                [ div [class "m1"] 
                    [ ShareAdd.addShare item
                    ]
                ]
        Added success ->
            ShareAdded.shareAdded success
            
             
        
        
