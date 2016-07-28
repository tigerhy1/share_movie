module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Commands exposing (fetchAll, add)
import String exposing (toInt)

update : Msg -> Model ->( Model, Cmd Msg )
update msg model =
    case msg of 
        ShowList ->
            ( model, fetchAll )
        
        AddShare ->
            ( AddModel (ShareItem 0 "" "" ""), Cmd.none )

        FetchAllDone shares ->
            ( ShowListModel shares, Cmd.none )
            {--( AddModel (ShareItem 0 "" "" ""), Cmd.none )--}

        FetchAllFail error ->
            ( model, Cmd.none )
      
        SubmitAddShare ->
            ( AddModel (ShareItem 0 "" "" ""), add model ) 
    
        ChangeId id ->
            case model of
                AddModel item ->
                    ( AddModel (ShareItem (toInt id |> Result.toMaybe |> Maybe.withDefault 0 ) item.user_name item.movie_name item.share_comment), Cmd.none ) 
                ShowListModel list ->
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
