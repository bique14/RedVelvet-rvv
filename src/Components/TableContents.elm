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
        [ { image = "String"
          , chapter = 1
          , title = "Fly me to the moon 🌕"
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
    , description = "RENE YEM"
    , title = "Fly me to the moon 🌕"
    , image = "String"
    , author = "me"
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model


view : (Msg -> msg) -> Model -> Html msg
view toMsg model =
    div [] [ text "Table of contents :)" ]
