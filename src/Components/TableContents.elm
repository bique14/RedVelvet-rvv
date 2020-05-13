module Components.TableContents exposing
    ( Model
    , Msg(..)
    , init
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


init : Model
init =
    { novel =
        [ { image = "https://th-test-11.slatic.net/p/c8748f5037839db2b4c85d88682907b2.jpg_340x340q80.jpg_.webp"
          , chapter = 1
          , title = "Prolouge"
          , description = "- Prologue -"
          , body =
                Novel.Chat
                    { data =
                        [ { text_ = "Hello, world"
                          , name = Just "Me"
                          , image = Just "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/01/a0001799/img/basic/a0001799_main.jpg?20191118104245&q=80&rw=750&rh=536"
                          , position = Novel.Right
                          }
                        , { text_ = ":)"
                          , name = Just "Me"
                          , image = Just "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/01/a0001799/img/basic/a0001799_main.jpg?20191118104245&q=80&rw=750&rh=536"
                          , position = Novel.Right
                          }
                        , { text_ = "เค้กที่มีสีแดงเข้ม (4)"
                          , name = Nothing
                          , image = Nothing
                          , position = Novel.Center
                          }
                        , { text_ = "07:54"
                          , name = Nothing
                          , image = Nothing
                          , position = Novel.Center
                          }
                        , { text_ = "ตื่นกันยัง"
                          , name = Just "rene"
                          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
                          , position = Novel.Left
                          }
                        , { text_ = "ยัง"
                          , name = Just "joyaaaaaa."
                          , image = Just "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRE46wbtwIsKheBdyAbkkViBAhG3fi2HaeCXwt3CT4B_IBFU2VU&usqp=CAU"
                          , position = Novel.Left
                          }
                        , { text_ = "แล้วนี่ใครตอบ"
                          , name = Just "rene"
                          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
                          , position = Novel.Left
                          }
                        , { text_ = "ตื่นละ"
                          , name = Just "yemmie 🍰"
                          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
                          , position = Novel.Right
                          }
                        , { text_ = "ทักมาแต่เช้าคือมีไร"
                          , name = Just "yemmie 🍰"
                          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
                          , position = Novel.Right
                          }
                        , { text_ = "ไม่มีไร"
                          , name = Just "rene"
                          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
                          , position = Novel.Left
                          }
                        , { text_ = "เอ๊า"
                          , name = Just "yemmie 🍰"
                          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
                          , position = Novel.Right
                          }
                        , { text_ = "เอ๊า"
                          , name = Just "joyaaaaaa."
                          , image = Just "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRE46wbtwIsKheBdyAbkkViBAhG3fi2HaeCXwt3CT4B_IBFU2VU&usqp=CAU"
                          , position = Novel.Left
                          }
                        ]

                    -- Reminder : If chats.length == data.length -> END CHAPTER
                    , chats = []
                    }
          }
        ]
    , description = "I've got a ticket for a world where we belong So would you be my baby? #ReneYem"
    , title = "Fly me to the moon 🌕"
    , image = "https://s359.kapook.com/pagebuilder/4da124f1-80a6-4278-b9b3-9b179d8582e4.jpg"
    , author = "me"
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model


view : (Msg -> msg) -> Model -> Html msg
view toMsg model =
    div [ class "h-full w-1/2 m-auto" ]
        [ div [ class "flex flex-col h-full" ]
            [ viewTitle model ]
        , viewChapters model.novel
        ]


viewTitle : Model -> Html msg
viewTitle { title, author, description, image } =
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
        , viewTags
        ]


viewTags : Html msg
viewTags =
    div [ class "z-10 my-4" ]
        [ div [ class "border-white border-t border-b text-center text-red-600 font-bold py-4 mx-10" ]
            [ span [] [ text "ทุ่งดอกไม้" ]
            ]
        , div [ class "flex justify-center my-3" ] <|
            List.map
                (\t ->
                    span [ class "border border-red-600 rounded text-red-600 font-bold px-2 py-1 mx-1" ]
                        [ text t ]
                )
                [ "Irene", "Yeri", "ReneYem", "RedVelvet" ]
        , div [ class "text-white text-center" ]
            [ span [] [ text "# 14 บท" ] ]
        ]


viewChapters : List Novel.Novel -> Html msg
viewChapters novel =
    div [ class "mt-2" ] <|
        List.map
            (\n ->
                div [ class "flex flex-row h-48 mb-2" ]
                    [ div [ class "w-40" ]
                        [ img [ src n.image, class "h-full w-full object-cover" ] []
                        ]
                    , div [ class "flex flex-col mt-2 mx-10" ]
                        [ span [ class "text-red-600" ]
                            [ text <| ("#" ++ String.fromInt n.chapter) ]
                        , span [ class "font-bold" ] [ text n.title ]
                        , span [ class "text-gray-500" ] [ text n.description ]
                        ]
                    ]
            )
            novel
