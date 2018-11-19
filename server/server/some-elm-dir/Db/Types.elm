module Db.Types exposing (..)

import Json.Decode exposing (..)

import Json.Decode.Pipeline exposing (..)

type alias Person =
    { id : Int
    , name : Maybe (String)
    }

decodePerson : Decoder Person
decodePerson =
    decode Person
        |> required "id" int
        |> required "name" (maybe string)