module Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
import Task
import Models exposing (ShareItem, Model(..))
import Messages exposing (Msg(..))
import String exposing (concat)

fetchAll : Int -> Int -> Cmd Msg
fetchAll offset size =
    fetchTask offset size
        |> Task.perform FetchAllFail FetchAllDone

fetchTask : Int -> Int -> Task.Task Http.Error (List ShareItem)
fetchTask offset size =
    let 
        strList = ["""{ "offset":""", toString offset, ""","size":""", toString size, " }"]
        
        body = Http.string (concat strList)
    
        config ={ verb = "POST"
                , headers = [ ( "Content-Type", "application/json" ) ]
                {--, headers = []--}
                , url = fetchAllUrl
                , body = body
                }
                
        setting = {
            timeout = 0
            , onStart = Nothing
            , onProgress = Nothing
            , desiredResponseType = Nothing
            , withCredentials = True
        }
        
    in 
        Http.send setting config
            |> Http.fromJson collectionDecoder

fetchAllUrl : String
fetchAllUrl =
    {--
    "http://localhost:4000/shares"
    --}
    {----}
    "http://114.215.112.211:8080/get-test"
    --}

collectionDecoder : Decode.Decoder (List ShareItem)
collectionDecoder =
    Decode.list shareItemDecoder

shareItemDecoder : Decode.Decoder ShareItem
shareItemDecoder =
    Decode.object4 ShareItem
        ("id" := Decode.int)
        ("user_name" := Decode.string)
        ("movie_name" := Decode.string)
        ("share_comment" := Decode.string)
        
addUrl : String
addUrl =
    {--
    "http://localhost:4000/shares/"
    --}
    "http://114.215.112.211:8080/add-share"

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
            
        setting = {
            timeout = 0
            , onStart = Nothing
            , onProgress = Nothing
            , desiredResponseType = Nothing
            , withCredentials = True
        }
    in 
        Http.send setting config
            |> Http.fromJson shareItemDecoder

add : Model -> Cmd Msg
add model =
    case model of
        AddModel item -> 
            addTask item
                |> Task.perform AddFail AddSuccess 

        ShowListModel list -> 
            Cmd.none 
            
        Added flag ->
            Cmd.none
            

shareItemEncoded : ShareItem -> Encode.Value
shareItemEncoded item =
    let 
        list =
            [ ( "uid", Encode.int 1 )
            , ( "movie_name", Encode.string item.movie_name )
            , ( "share_comment", Encode.string item.share_comment )       
            ]
        in 
            list
                |> Encode.object





  

