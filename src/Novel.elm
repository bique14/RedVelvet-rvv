module Novel exposing
    ( Novel
    , NovelType(..)
    , Position(..)
    , init
    )


type alias Model =
    { novel : List Novel
    , description : String
    , title : String
    , image : String
    , author : String
    }


type alias Novel =
    { image : String
    , chapter : Int
    , title : String
    , description : String
    , body : NovelType
    }


type NovelType
    = Chat
        { data : List ChatDetail
        , chats : List ChatDetail
        }
    | Story { text_ : String }


type alias ChatDetail =
    { text_ : String
    , name : Maybe String
    , image : Maybe String
    , position : Position
    }


type Position
    = Left
    | Center
    | Right


init : Model
init =
    { novel =
        [ { image = "String"
          , chapter = 1
          , title = "Fly me to the moon 🌕"
          , description = "- Prologue -"
          , body =
                Chat
                    { data =
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
