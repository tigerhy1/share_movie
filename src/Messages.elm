module Messages exposing (..)

import Http
import Models exposing (ShareItem)

type Msg
   = ShowList 
   | ShowListMore
   | AddShare
   | FetchAllDone (List ShareItem)
   | FetchAllFail Http.Error
   | AddSuccess ShareItem
   | AddFail Http.Error
   | SubmitAddShare
   | ChangeName String
   | ChangeComment String
   | ChangeId String

