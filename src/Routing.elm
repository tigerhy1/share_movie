module Routing exposing (..)

import Navigation
import String
import UrlParser exposing(..)
import Debug exposing (log)

type Route
    = ShowListRoute
    | ShowAddRoute
    | NotFoundRoute

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ format ShowListRoute (s "index")
        , format ShowAddRoute (s "add")
        ]

hashParser : Navigation.Location -> Result String Route
hashParser location =
    location.hash
        |> String.dropLeft 1
        |> parse identity matchers

{-- This is the navigation entry point --}
parser : Navigation.Parser (Result String Route)
parser =
    Navigation.makeParser hashParser

routeFromResult : Result String Route -> Route
routeFromResult result =
    case result of
        Ok route ->
            log "route " route
        Err string ->
            NotFoundRoute