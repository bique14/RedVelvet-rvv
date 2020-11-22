module Components.TableContents exposing
    ( Model
    , Msg(..)
    , update
    , view
    )

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class, src, style)
import Html.Styled.Events exposing (onClick)
import Novel


type alias Model =
    Novel.Model


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model


view : (Msg -> msg) -> (Int -> msg) -> Model -> Html msg
view toMsg contentsClicked model =
    -- TODO: Mobile screen : class "h-sm:p-2 h-sm:my-3 h-640:p-2 h-640:my-3"
    -- Add tailwind.config.js
    div [ class "h-full w-1/2 m-auto mobile:w-full" ]
        [ div [ class "flex flex-col h-full" ]
            [ viewTitle model ]
        , viewChapters contentsClicked model.novel
        ]


viewTitle : Model -> Html msg
viewTitle { novel, title, author, description, image } =
    div
        [ class "flex flex-col relative h-full"
        ]
        [ img
            [ src image
            , class "absolute w-full h-full object-cover"
            , style "filter" "blur(2px)"
            ]
            []
        , div [ class "z-10 flex flex-col text-white justify-center text-center h-full mx-10" ]
            [ h1 [ class "font-bold text-4xl" ] [ text title ]
            , span [ class "text-xl inline-block my-2" ] [ text author ]
            , span [ class "text-xl inline-block my-2" ] [ text description ]
            ]
        , viewTags novel
        ]


viewTags : List Novel.Novel -> Html msg
viewTags novel =
    div [ class "z-10 my-4" ]
        [ div [ class "border-white border-t border-b text-center text-red-600 font-bold py-4 mx-10" ]
            [ span [] [ text "ทุ่งดอกไม้" ]
            ]
        , div [ class "flex justify-center my-3 mobile:text-xs" ] <|
            List.map
                (\t ->
                    span [ class "border border-red-600 rounded text-red-600 font-bold px-2 py-1 mx-1" ]
                        [ text t ]
                )
                [ "Wenrene", "Joyri", "Redvelvet" ]
        , div [ class "text-white text-center" ]
            [ span []
                [ text <| String.concat [ "# ", String.fromInt (List.length novel), " บท" ] ]
            ]
        ]


viewChapters : (Int -> msg) -> List Novel.Novel -> Html msg
viewChapters contentsClicked novel =
    div [ class "mt-2" ] <|
        List.map
            (\n ->
                div
                    [ class "flex flex-row h-48 mb-2 cursor-pointer"
                    , onClick <| contentsClicked n.chapter
                    ]
                    [ div [ class "w-40" ]
                        [ img [ src n.image, class "h-full w-full object-cover" ] []
                        ]
                    , div [ class "flex flex-col mt-2 mx-10" ]
                        [ div [ class "flex flex-row" ]
                            [ span [ class "text-red-600" ]
                                [ text <| ("#" ++ String.fromInt n.chapter) ]
                            , span [ class "mx-2 text-gray-500" ]
                                [ case n.body of
                                    Novel.Chat _ ->
                                        text "แชท"

                                    Novel.Story _ ->
                                        text "สตอรี่"
                                ]
                            ]
                        , span [ class "font-bold" ] [ text n.title ]
                        , span [ class "text-gray-700" ] [ text n.description ]
                        ]
                    ]
            )
            novel
