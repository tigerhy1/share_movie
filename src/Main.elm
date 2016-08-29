module Main exposing (..)

import Html.App
import Messages exposing (Msg)
import Models exposing (..)
import View exposing (view)
import Update exposing (update)
import ShareList exposing (..)
import Commands exposing (fetchAll)
import Routing exposing (..)
import Navigation
import Debug exposing(log)


--init : ( Model, Cmd Msg )
--init =
--    (ShowListModel
--         { list = []
--         , start = 0
--         , end = 0
--         } 
--     , fetchAll 0 5)

init : Result String Route -> ( Model, Cmd Msg )
init result =
    let 
        currentRoute = 
            (log "current Route =" (Routing.routeFromResult result))
    in 
        case currentRoute of
            ShowListRoute ->
                ( ShowListModel
                  { list = []
                  , start = 0
                  , end = 0
                  } 
                  , fetchAll 0 5 )
            
            ShowAddRoute ->
                ( AddModel (ShareItem 0 "" "" ""), Cmd.none )
                
            _ ->
                ( AddModel (ShareItem 0 "" "" ""), Cmd.none )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


urlUpdate : Result String Route -> Model -> ( Model, Cmd Msg )
urlUpdate result model = 
    let 
        currentRoute = 
            Routing.routeFromResult result
    in 
        case currentRoute of
            ShowListRoute ->
                ( ShowListModel
                  { list = []
                  , start = 0
                  , end = 0
                  } 
                  , fetchAll 0 5 )
            
            ShowAddRoute ->
                ( AddModel (ShareItem 0 "" "" ""), Cmd.none )
                
            _ ->
                ( AddModel (ShareItem 0 "" "" ""), Cmd.none )

-- MAIN


main : Program Never
main =
    Navigation.program Routing.parser
        { init = init
        , view = view
        , update = update
        , urlUpdate = urlUpdate
        , subscriptions = subscriptions
        }

