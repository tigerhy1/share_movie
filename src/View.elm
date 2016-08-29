module View exposing (..)

import Html exposing (Html, div, ul, li, text, button, h1, a)
import Html.Attributes exposing (class, attribute, href)
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
        ShowListModel data  -> 
            div[ class "container-fluid"]
               [ div [ class "row m1" ] []
               , div [ class "m1"] 
                    [
                        ul  [ class "nav nav-pills" ]
                        [ li [ class "active" ] 
                             [ a [ href "" ] [ text "Show" ] ] 
                        , li []
                             [ a [ ] [ text "ShowMore" ] ]
                        , li []
                             [ a [ href "#add" ] [ text "Add" ] ]
                        ]
                    , ShareList.showList data 
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
            
             
        
        
