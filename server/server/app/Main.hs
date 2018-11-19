{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Proxy
import Elm
import GHC.Generics
import Lib

main :: IO ()
main = someFunc

data Person = Person
  { id :: Int
  , name :: Maybe String
  } deriving (Show, Eq, Generic, ElmType)

spec :: Spec
spec =
  Spec
    ["Db", "Types"]
    [ "import Json.Decode exposing (..)"
    , "import Json.Decode.Pipeline exposing (..)"
    , toElmTypeSource (Proxy :: Proxy Person)
    , toElmDecoderSource (Proxy :: Proxy Person)
    ]

generateElm :: IO ()
generateElm = specsToDir [spec] "some-elm-dir"
