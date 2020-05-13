module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Styled exposing (toUnstyled)
import Pages.Novel as Novel


type alias Model =
    { state : State }


type State
    = TableContents
    | Novel Novel.Model


type Msg
    = NoOp
    | NovelMsg Novel.Msg


init : ( Model, Cmd Msg )
init =
    let
        ( md, _ ) =
            Novel.init
    in
    ( { state = Novel md }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model.state, msg ) of
        ( Novel model_, NovelMsg msg_ ) ->
            let
                updated : ( Novel.Model, Cmd Novel.Msg )
                updated =
                    Novel.update msg_ model_
            in
            ( { model | state = Novel <| Tuple.first updated }
            , Cmd.map NovelMsg <| Tuple.second updated
            )

        _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view { state } =
    case state of
        TableContents ->
            div [] [ text "table contents" ]

        Novel model_ ->
            map NovelMsg <| toUnstyled <| Novel.view model_


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
