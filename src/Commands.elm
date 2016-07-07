module Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import Task
import Models exposing (ShareItem, Model(..))
import Messages exposing (Msg(..))

fetchAll : Cmd Msg
fetchAll =
   Http.get collectionDecoder fetchAllUrl
       |> Task.perform FetchAllFail FetchAllDone

fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/shares"

collectionDecoder : Decode.Decoder (List ShareItem)
collectionDecoder =
    Decode.list shareItemDecoder

shareItemDecoder : Decode.Decoder ShareItem
shareItemDecoder =
    Decode.object3 ShareItem
        ("id" := Decode.int)
        ("movie_name" := Decode.string)
        ("share_comment" := Decode.string)
        
addUrl : String
addUrl =
    "http://localhost:4000/shares/"

addTask : ShareItem -> Task.Task Http.Error ShareItem
addTask item =
    let
        body = 
            shareItemEncoded item
                |> Encode.encode 0
                |> Http.string

        config = 
            { verb = "POST"
            , headers = [ ( "Content-Type", "application/json" ) ]
            , url = addUrl
            , body = body
            }
    in 
        Http.send Http.defaultSettings config
            |> Http.fromJson shareItemDecoder

add : Model -> Cmd Msg
add model =
    case model of
        AddModel item -> 
            addTask item
                |> Task.perform AddFail AddSuccess 

        ShowListModel list -> 
            Cmd.none 
            

shareItemEncoded : ShareItem -> Encode.Value
shareItemEncoded item =
    let 
        list =
            [ ( "id", Encode.int item.id )
            , ( "movie_name", Encode.string item.movie_name )
            , ( "share_comment", Encode.string item.share_comment )       
            ]
        in 
            list
                |> Encode.object





  

