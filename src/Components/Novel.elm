module Components.Novel exposing
    ( Model
    , Msg(..)
    , init
    , update
    , view
    )

import Array
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class, src, style)
import Html.Styled.Events exposing (onClick)


type alias Model =
    { title : String
    , description : String
    , data : List Chat
    , chats : List Chat
    }


type alias Chat =
    { text_ : String
    , name : Maybe String
    , image : Maybe String
    , position : Position
    }


type Position
    = Left
    | Center
    | Right


type Msg
    = Read


init : Model
init =
    { title = "(RENEYEM) Fly me to the moon 🌕"
    , description = "- Prologue -"
    , data =
        [ { text_ = "Hello, world"
          , name = Just "Me"
          , image = Just "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/01/a0001799/img/basic/a0001799_main.jpg?20191118104245&q=80&rw=750&rh=536"
          , position = Right
          }
        , { text_ = ":)"
          , name = Just "Me"
          , image = Just "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/01/a0001799/img/basic/a0001799_main.jpg?20191118104245&q=80&rw=750&rh=536"
          , position = Right
          }
        , { text_ = "เค้กที่มีสีแดงเข้ม (4)"
          , name = Nothing
          , image = Nothing
          , position = Center
          }
        , { text_ = "07:54"
          , name = Nothing
          , image = Nothing
          , position = Center
          }
        , { text_ = "ตื่นกันยัง"
          , name = Just "rene"
          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
          , position = Left
          }
        , { text_ = "ยัง"
          , name = Just "joyaaaaaa."
          , image = Just "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRE46wbtwIsKheBdyAbkkViBAhG3fi2HaeCXwt3CT4B_IBFU2VU&usqp=CAU"
          , position = Left
          }
        , { text_ = "แล้วนี่ใครตอบ"
          , name = Just "rene"
          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
          , position = Left
          }
        , { text_ = "ตื่นละ"
          , name = Just "yemmie 🍰"
          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
          , position = Right
          }
        , { text_ = "ทักมาแต่เช้าคือมีไร"
          , name = Just "yemmie 🍰"
          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
          , position = Right
          }
        , { text_ = "ไม่มีไร"
          , name = Just "rene"
          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
          , position = Left
          }
        , { text_ = "เอ๊า"
          , name = Just "yemmie 🍰"
          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
          , position = Right
          }
        , { text_ = "เอ๊า"
          , name = Just "joyaaaaaa."
          , image = Just "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRE46wbtwIsKheBdyAbkkViBAhG3fi2HaeCXwt3CT4B_IBFU2VU&usqp=CAU"
          , position = Left
          }
        ]
    , chats = []
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Read ->
            case model.data of
                x :: _ ->
                    let
                        a_ =
                            Array.push x (Array.fromList model.chats)
                                |> Array.toList
                    in
                    { model | chats = a_, data = List.drop 1 model.data }

                _ ->
                    model


view : (Msg -> msg) -> Model -> Html msg
view toMsg model =
    div [ class "bg-red-300 h-full w-1/2 m-auto" ]
        [ div [ class "flex flex-col h-full" ]
            [ viewTitle model
            , viewChats model
            , viewButton toMsg
            ]
        ]


viewTitle : Model -> Html msg
viewTitle { title, description } =
    div [ class "text-center text-white py-3 bg-black" ]
        [ h1 [ class "font-bold" ] [ text title ]
        , span [ class "text-xs" ] [ text description ]
        ]


viewChats : Model -> Html msg
viewChats { chats } =
    div
        [ class "bg-gray-900 pt-4 overflow-auto"
        , style "height" "80%"
        ]
    <|
        List.map
            (\c ->
                viewBubble c
            )
            chats


viewBubble : Chat -> Html msg
viewBubble { text_, name, image, position } =
    div [ class "my-2 mx-4 text-white" ]
        [ case position of
            Left ->
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

            Center ->
                div [ class "flex justify-center" ]
                    [ span [ class "border border-gray-600 rounded bg-gray-600 px-1" ]
                        [ text text_ ]
                    ]

            Right ->
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
