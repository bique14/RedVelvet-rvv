module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Styled exposing (toUnstyled)
import Novel
import Pages.Novel as NovelPages
import Pages.TableContents as TableContents


type alias Model =
    { state : State }


type State
    = TableContents TableContents.Model
    | Novel NovelPages.Model


type Msg
    = NovelMsg NovelPages.Msg
    | TableContentsMsg TableContents.Msg


init : ( Model, Cmd Msg )
init =
    let
        ( initNovel, _ ) =
            NovelPages.init Novel.init 1

        ( tableContentsModel, _ ) =
            TableContents.init
    in
    -- ( { state = Novel initNovel }, Cmd.none )
    ( { state = TableContents tableContentsModel }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model.state, msg ) of
        ( TableContents _, TableContentsMsg (TableContents.ContentsClicked chapter) ) ->
            let
                ( initNovel, _ ) =
                    NovelPages.init Novel.init chapter
            in
            ( { model | state = Novel initNovel }
            , Cmd.none
            )

        ( TableContents model_, TableContentsMsg msg_ ) ->
            let
                updated : ( TableContents.Model, Cmd TableContents.Msg )
                updated =
                    TableContents.update msg_ model_
            in
            ( { model | state = TableContents <| Tuple.first updated }
            , Cmd.map TableContentsMsg <| Tuple.second updated
            )

        ( Novel _, NovelMsg NovelPages.OnBackClicked ) ->
            let
                ( tableContentsModel, _ ) =
                    TableContents.init
            in
            ( { state = TableContents tableContentsModel }, Cmd.none )

        ( Novel model_, NovelMsg msg_ ) ->
            let
                updated : ( NovelPages.Model, Cmd NovelPages.Msg )
                updated =
                    NovelPages.update msg_ model_
            in
            ( { model | state = Novel <| Tuple.first updated }
            , Cmd.map NovelMsg <| Tuple.second updated
            )

        _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view { state } =
    case state of
        TableContents model_ ->
            map TableContentsMsg <| toUnstyled <| TableContents.view model_

        Novel model_ ->
            map NovelMsg <| toUnstyled <| NovelPages.view model_


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
