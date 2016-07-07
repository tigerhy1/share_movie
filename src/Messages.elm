module Messages exposing (..)

import Http
import Models exposing (ShareItem)

type Msg
   = ShowList 
   | AddShare
   | FetchAllDone (List ShareItem)
   | FetchAllFail Http.Error
   | AddSuccess ShareItem
   | AddFail Http.Error
   | SubmitAddShare
   | ChangeName String
   | ChangeComment String
   | ChangeId String

