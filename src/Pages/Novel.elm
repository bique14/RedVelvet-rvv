module Pages.Novel exposing
    ( Model(..)
    , Msg(..)
    , init
    , update
    , view
    )

import Components.Novel as Novel
import Html.Styled exposing (..)


type Model
    = Novel Novel.Model


type Msg
    = NoOp
    | NovelMsg Novel.Msg


init : ( Model, Cmd Msg )
init =
    ( Novel Novel.init, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( Novel model_, NovelMsg msg_ ) ->
            let
                updated : Novel.Model
                updated =
                    Novel.update msg_ model_
            in
            ( Novel updated, Cmd.none )

        _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model of
        Novel model_ ->
            Novel.view
                NovelMsg
                model_
