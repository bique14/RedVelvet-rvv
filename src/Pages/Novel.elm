module Pages.Novel exposing
    ( Model(..)
    , Msg(..)
    , init
    , update
    , view
    )

import Components.Novel as NovelComponents
import Html.Styled exposing (..)
import Novel


type Model
    = Novel NovelComponents.Model
    | Impossible


type Msg
    = NoOp
    | NovelMsg NovelComponents.Msg
    | OnBackClicked


toNovel : Novel.Novel -> NovelComponents.Model
toNovel novel =
    { image = novel.image
    , chapter = novel.chapter
    , title = novel.title
    , description = novel.description
    , body = novel.body
    }


init : Novel.Model -> Int -> ( Model, Cmd Msg )
init novel chapter =
    let
        selectedChapter =
            List.filter (\s -> s.chapter == chapter) novel.novel
    in
    case selectedChapter of
        x :: _ ->
            ( Novel <| toNovel x, Cmd.none )

        _ ->
            ( Impossible, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( Novel model_, NovelMsg msg_ ) ->
            let
                updated : NovelComponents.Model
                updated =
                    NovelComponents.update msg_ model_
            in
            ( Novel updated, Cmd.none )

        _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model of
        Novel model_ ->
            NovelComponents.view
                NovelMsg
                OnBackClicked
                model_

        Impossible ->
            div [] [ text "You should not see this" ]
