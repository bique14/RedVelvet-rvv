module Components.Novel exposing
    ( Model
    , Msg(..)
    , update
    , view
    )

import Array
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class, src, style)
import Html.Styled.Events exposing (onClick)
import Novel


type alias Model =
    { image : String
    , chapter : Int
    , title : String
    , description : String
    , body : NovelType
    }


type alias NovelType =
    Novel.NovelType


type Msg
    = Read


update : Msg -> Model -> Model
update msg model =
    case msg of
        Read ->
            case model.body of
                Novel.Chat { data, chats } ->
                    case data of
                        x :: _ ->
                            let
                                newChats =
                                    Array.push x (Array.fromList chats)
                                        |> Array.toList
                            in
                            { model | body = Novel.Chat { data = List.drop 1 data, chats = newChats } }

                        _ ->
                            model

                Novel.Story { text_ } ->
                    model


view : (Msg -> msg) -> Model -> Html msg
view toMsg model =
    div [ class "bg-red-300 h-full w-1/2 m-auto" ]
        [ div [ class "flex flex-col h-full" ]
            [ viewTitle model
            , viewNovelType model
            , viewButton toMsg
            ]
        ]


viewTitle : Model -> Html msg
viewTitle { title, description } =
    div [ class "text-center text-white py-3 bg-black" ]
        [ h1 [ class "font-bold" ] [ text title ]
        , span [ class "text-xs" ] [ text description ]
        ]


viewNovelType : Model -> Html msg
viewNovelType { body } =
    case body of
        Novel.Chat { data, chats } ->
            viewChats chats

        Novel.Story { text_ } ->
            div [] [ text "story" ]


viewChats : List Novel.ChatDetails -> Html msg
viewChats chats =
    div
        [ class "bg-gray-900 pt-4 overflow-auto"
        , style "height" "80%"
        ]
    <|
        List.map
            (\c ->
                viewBubbles c
             -- div [] []
            )
            chats


viewBubbles : Novel.ChatDetails -> Html msg
viewBubbles { text_, name, image, position } =
    div [ class "my-2 mx-4 text-white" ]
        [ case position of
            Novel.Left ->
                div [ class "flex flex-row flex-start" ]
                    [ case image of
                        Just i ->
                            img
                                [ src i
                                , class "h-16 w-16 rounded-full object-cover"
                                ]
                                []

                        Nothing ->
                            span [ class "hidden" ] []
                    , div [ class "flex flex-col ml-2" ]
                        [ case name of
                            Just n ->
                                span [ class "font-bold" ] [ text n ]

                            Nothing ->
                                span [ class "hidden" ] []
                        , div [ class "inline mt-2" ]
                            [ span [ class "border border-gray-700 rounded-full bg-gray-700 px-2 py-2" ]
                                [ text text_ ]
                            ]
                        ]
                    ]

            Novel.Center ->
                div [ class "flex justify-center" ]
                    [ span [ class "border border-gray-600 rounded bg-gray-600 px-1" ]
                        [ text text_ ]
                    ]

            Novel.Right ->
                div [ class "flex flex-row-reverse" ]
                    [ case image of
                        Just i ->
                            img
                                [ src i
                                , class "h-16 w-16 rounded-full object-cover"
                                ]
                                []

                        Nothing ->
                            span [ class "hidden" ] []
                    , div [ class "flex flex-col mr-2" ]
                        [ case name of
                            Just n ->
                                span [ class "font-bold text-right" ] [ text n ]

                            Nothing ->
                                span [ class "hidden" ] []
                        , div [ class "inline mt-2 text-right" ]
                            [ span [ class "border border-gray-700 rounded-full bg-gray-700 px-2 py-2" ]
                                [ text text_ ]
                            ]
                        ]
                    ]
        ]


viewButton : (Msg -> msg) -> Html msg
viewButton toMsg =
    div
        [ class "bg-black text-white"
        , style "height" "20%"
        ]
        [ map toMsg <|
            button
                [ class "w-full h-full font-bold"
                , onClick Read
                ]
                [ text "Tap to read" ]
        ]
