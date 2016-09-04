module View exposing (..)

import Html exposing (Html, div, ul, li, text, button, h1, a)
import Html.Attributes exposing (class, attribute, href)
import Messages exposing (..)
import Models exposing (Model(..))
import ShareList exposing (showList)
import ShareAdd exposing (addShare)
import ShareAdded exposing (shareAdded)
--import Selector exposing (..)
import LoadMore exposing (loadMore)
import Html.Events exposing (onClick)

classStr : Int -> Int -> String
classStr idxRef idx =
    if idx == idxRef then "m1 active" else "m1"
    

tabNav : Int -> Html Msg
tabNav idx =
    ul  [ class "nav nav-pills" ]
        [ li [ class (classStr 1 idx) ] 
             [ a [ href "#index" ] [ text "最新" ] ] 
        , li [ class (classStr 2 idx) ]
             [ a [ ] [ text "喜欢" ] ]
        , li [ class (classStr 3 idx) ]
             [ a [ href "#add" ] [ text "分享" ] ]
        ]

view : Model -> Html Msg
view model =
    case model of
        ShowListModel data  -> 
            div[ class "container-fluid"]
               [ div [ class "row m1" ] []
               , div [ class "m1"] 
                    [ tabNav 1
                    , ShareList.showList data 
                    , loadMore  
                    ]
                {--
                div [ class "col-md-2 col-xs-1"]
                    []
                --}
               ]
        AddModel item ->
            div [ class "container-fluid" ]
                [ div [ class "row m1" ] []
                , div [class "m1"] 
                    [ tabNav 3
                    , ShareAdd.addShare item
                    ]
                ]
        Added success ->
            ShareAdded.shareAdded success
            
             
        
        
