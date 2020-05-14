module Pages.TableContents exposing
    ( Model(..)
    , Msg(..)
    , init
    , update
    , view
    )

import Components.TableContents as TableContents
import Html.Styled exposing (..)
import Novel


type Model
    = TableContents TableContents.Model


type Msg
    = NoOp
    | TableContentsMsg TableContents.Msg
    | ContentsClicked Int


init : ( Model, Cmd Msg )
init =
    ( TableContents Novel.init, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( TableContents model_, TableContentsMsg msg_ ) ->
            let
                updated : TableContents.Model
                updated =
                    TableContents.update msg_ model_
            in
            ( TableContents updated, Cmd.none )

        _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model of
        TableContents model_ ->
            TableContents.view
                TableContentsMsg
                ContentsClicked
                model_
