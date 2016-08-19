module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Commands exposing (fetchAll, add)
import String exposing (toInt)
import List exposing (append, head, reverse)

mergeShares : ShowListData -> (List ShareItem) -> ShowListData
mergeShares showListData l =
    let 
        { list, start, end } 
        = showListData
        
        first = Maybe.withDefault (ShareItem 0 "" "" "") ( head (reverse l) )
        
        last = Maybe.withDefault (ShareItem 0 "" "" "") ( head l )
        
        newStart = if (start == 0) then first.id else (min first.id start)
        
        newEnd = max last.id end
        
    in 
        { list = append list l 
        , start = newStart
        , end = newEnd
        }

update : Msg -> Model ->( Model, Cmd Msg )
update msg model =
    case msg of 
        ShowList ->
            ( ShowListModel
                 { list = []
                 , start = 0
                 , end = 0
                 } 
            , fetchAll 0 5 )
            
        ShowListMore ->
            case model of
                ShowListModel data ->
                    let
                        { start
                        } = data
                    in 
                        ( model, if ( start > 1 ) then (fetchAll (start - 1) 5) else Cmd.none)
                _ ->
                    ( model, Cmd.none)
        
        AddShare ->
            ( AddModel (ShareItem 0 "" "" ""), Cmd.none )

        FetchAllDone shares ->
            case model of
                AddModel item ->
                    ( model, Cmd.none )
                ShowListModel data ->
                    ( ShowListModel (mergeShares data shares), Cmd.none )
                Added item ->
                    ( model, Cmd.none )
            {--( AddModel (ShareItem 0 "" "" ""), Cmd.none )--}

        FetchAllFail error ->
            ( model, Cmd.none )
      
        SubmitAddShare ->
            ( AddModel (ShareItem 0 "" "" ""), add model )
            {--( AddModel (ShareItem 0 "" "" ""), Cmd.none )--}
    
        ChangeId id ->
            case model of
                AddModel item ->
                    ( AddModel (ShareItem (toInt id |> Result.toMaybe |> Maybe.withDefault 0 ) item.user_name item.movie_name item.share_comment), Cmd.none ) 
                ShowListModel data ->
                    ( model, Cmd.none )
                Added item ->
                    ( model, Cmd.none )

        ChangeName name ->
            case model of 
                AddModel item ->
                    ( AddModel (ShareItem item.id item.user_name name item.share_comment), Cmd.none ) 
                ShowListModel list ->
                    ( model, Cmd.none )
                Added item ->
                    ( model, Cmd.none )

        ChangeComment comment ->
            case model of 
                AddModel item ->
                    ( AddModel (ShareItem item.id item.user_name item.movie_name comment ) , Cmd.none )
                ShowListModel list ->
                    ( model, Cmd.none )
                Added item ->
                    ( model, Cmd.none )
    
        AddSuccess item ->
            ( Added True, Cmd.none )

        AddFail err ->
            ( Added False, Cmd.none )
