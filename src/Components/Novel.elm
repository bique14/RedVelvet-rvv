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
    , fontSize : String
    }


type alias NovelType =
    Novel.NovelType


type Msg
    = Read
    | FontSize FontSize


type FontSize
    = Increase
    | Decrease


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

        FontSize size ->
            case size of
                Increase ->
                    case model.fontSize of
                        "text-xs" ->
                            { model | fontSize = "text-sm" }

                        "text-sm" ->
                            { model | fontSize = "text-base" }

                        "text-base" ->
                            { model | fontSize = "text-lg" }

                        "text-lg" ->
                            { model | fontSize = "text-xl" }

                        _ ->
                            model

                Decrease ->
                    case model.fontSize of
                        "text-xl" ->
                            { model | fontSize = "text-lg" }

                        "text-lg" ->
                            { model | fontSize = "text-base" }

                        "text-base" ->
                            { model | fontSize = "text-sm" }

                        "text-sm" ->
                            { model | fontSize = "text-xs" }

                        _ ->
                            model


view : (Msg -> msg) -> msg -> Model -> Html msg
view toMsg onBackClicked model =
    div [ class "bg-red-300 h-full w-1/2 m-auto mobile:w-full" ]
        [ div [ class "flex flex-col h-full" ]
            [ viewTitle onBackClicked model
            , viewNovelType toMsg model
            , viewButton toMsg model
            ]
        ]


viewTitle : msg -> Model -> Html msg
viewTitle onBackClicked { title, description } =
    div [ class "text-center text-white py-3 bg-black relative" ]
        [ div
            [ class "absolute w-8"
            , style "top" "15px"
            , style "left" "20px"
            ]
            [ button
                [ class "text-red-600 text-2xl font-bold w-full"
                , onClick onBackClicked
                ]
                [ text "<" ]
            ]
        , h1 [ class "font-bold" ] [ text title ]
        , span [ class "text-xs" ] [ text description ]
        ]


viewNovelType : (Msg -> msg) -> Model -> Html msg
viewNovelType toMsg { description, body, fontSize } =
    case body of
        Novel.Chat { data, chats } ->
            viewChats chats

        Novel.Story { text_ } ->
            viewStory toMsg description text_ fontSize


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


viewButton : (Msg -> msg) -> Model -> Html msg
viewButton toMsg { body } =
    case body of
        Novel.Chat { data, chats } ->
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

        Novel.Story { text_ } ->
            div [ class "hidden" ] []


viewStory : (Msg -> msg) -> String -> String -> String -> Html msg
viewStory toMsg description story fontSize =
    div [ class "bg-gray-900 pt-4 overflow-auto h-full px-16 relative" ]
        [ map toMsg <|
            div
                [ class "flex flex-col absolute bg-black text-black"
                , style "top" "1rem"
                , style "right" "1rem"
                ]
                [ button
                    [ class "bg-white border px-2 rounded"
                    , onClick <| FontSize Increase
                    ]
                    [ text "+aA" ]
                , button
                    [ class "bg-white border px-2 rounded mt-2"
                    , onClick <| FontSize Decrease
                    ]
                    [ text "-aA" ]
                ]
        , h1 [ class "text-red-600 text-4xl text-center font-bold border-b mt-6 pb-10 mobile-w:text-xl" ] [ text description ]
        , pre
            [ class "whitespace-pre-wrap font-sans text-white mt-8"
            , class fontSize
            ]
            [ text story ]
        , h1 [ class "text-red-600 text-4xl text-center font-bold border-t mt-10 py-10" ] [ text "END" ]
        ]
