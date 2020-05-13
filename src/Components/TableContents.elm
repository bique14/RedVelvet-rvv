module Components.TableContents exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type Msg
    = NoOp


view : Html Msg
view =
    div [] [ text "Table of contents" ]
