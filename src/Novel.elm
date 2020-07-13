module Novel exposing
    ( ChatDetails
    , Model
    , Novel
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
        { data : List ChatDetails
        , chats : List ChatDetails
        }
    | Story { text_ : String }


type alias ChatDetails =
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
        [ { image = "/static/chapter-image.jpeg"
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
        , { image = "/static/chapter-image.jpeg"
          , chapter = 2
          , title = "Fly me to the moon 🌕"
          , description = "- In & Out -"
          , body =
                Chat
                    { data =
                        [ { text_ = "เค้กที่มีสีแดงเข้ม (4)"
                          , name = Nothing
                          , image = Nothing
                          , position = Center
                          }
                        , { text_ = "17:54"
                          , name = Nothing
                          , image = Nothing
                          , position = Center
                          }
                        , { text_ = "เมื่อวานแย่มาก"
                          , name = Just "rene"
                          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
                          , position = Left
                          }
                        , { text_ = "ทำไม"
                          , name = Just "joyaaaaaa."
                          , image = Just "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRE46wbtwIsKheBdyAbkkViBAhG3fi2HaeCXwt3CT4B_IBFU2VU&usqp=CAU"
                          , position = Left
                          }
                        , { text_ = "ไม่บอก"
                          , name = Just "rene"
                          , image = Just "https://pbs.twimg.com/profile_images/575553189128241152/0pcpSuBj.jpeg"
                          , position = Left
                          }
                        , { text_ = "เอ้า"
                          , name = Just "yemmie 🍰"
                          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
                          , position = Right
                          }
                        , { text_ = "อะไรของมึง"
                          , name = Just "yemmie 🍰"
                          , image = Just "https://f.ptcdn.info/719/056/000/p5y7d52h0K76U7UOSr-o.jpg"
                          , position = Right
                          }
                        , { text_ = "อิบ้า"
                          , name = Just "joyaaaaaa."
                          , image = Just "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRE46wbtwIsKheBdyAbkkViBAhG3fi2HaeCXwt3CT4B_IBFU2VU&usqp=CAU"
                          , position = Left
                          }
                        ]

                    -- Reminder : If chats.length == data.length -> END CHAPTER
                    , chats = []
                    }
          }
        , { image = "/static/chapter-image.jpeg"
          , chapter = 3
          , title = "Fly me to the moon 🌕"
          , description = "- Somethin kinda crazy -"
          , body =
                Story
                    { text_ = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec faucibus, \nnisi non lobortis condimentum, ex elit vestibulum dui, ac hendrerit libero magna et risus. Proin ac dolor efficitur, porttitor tellus imperdiet, aliquet neque. Sed pretium est magna, ac accumsan tellus consequat id. Nunc orci libero, finibus id sapien nec, sagittis tincidunt est. Proin vehicula, erat non scelerisque pretium, justo massa molestie orci, sit amet tristique justo justo id mauris. Mauris bibendum quam ultrices, vestibulum est ut, faucibus augue. Maecenas libero mauris, aliquet nec dictum mattis, tincidunt at purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor neque id dui accumsan suscipit. In enim nulla, semper vel arcu vel, placerat ultrices augue. Etiam suscipit nunc ut interdum porttitor. Quisque dignissim quam vel nunc placerat volutpat. Donec arcu nunc, pulvinar at dignissim et, vehicula nec massa. Phasellus tempor arcu leo, quis commodo enim pharetra sed. Suspendisse nec ipsum tellus.\n\nMaecenas maximus ac quam ac laoreet. Aenean interdum nibh ut molestie placerat. Suspendisse mollis libero lorem, elementum ultricies ligula ultrices quis. Pellentesque a nisi tellus. Praesent congue neque vel blandit luctus. In pretium risus erat, et eleifend sem placerat ac. Sed ullamcorper quis metus nec euismod. Maecenas convallis felis bibendum felis blandit, vel lacinia erat rhoncus. Duis consectetur consequat erat, nec sollicitudin diam rutrum eget. Nam condimentum venenatis orci sit amet tempus. Proin mattis odio nec bibendum semper. Duis viverra metus lectus, vitae sollicitudin leo viverra vel. Suspendisse ac nisi eget felis sagittis malesuada. Curabitur pellentesque elit nec justo iaculis scelerisque. Quisque egestas enim eget orci accumsan, sed pretium odio ornare. Phasellus fringilla ante sit amet diam consectetur, quis sodales neque sagittis.\n\nProin vitae egestas mauris, blandit scelerisque urna. Vivamus finibus aliquet lorem ac scelerisque. Etiam libero purus, sodales a ligula in, mollis sagittis justo. Nullam interdum a lectus sed volutpat. Sed malesuada mi elit, ac consequat purus sagittis a. Quisque non est molestie, mollis ex facilisis, fermentum eros. Curabitur eu accumsan lectus. Donec euismod dolor mollis enim tincidunt imperdiet.\n\nDonec et sodales diam, ac fringilla sem. Maecenas facilisis molestie lorem id suscipit. Phasellus eget placerat nisi. Aliquam vitae metus ut tortor tempor dictum id ac odio. Proin vel tristique mi, eu dictum ante. Praesent id ipsum velit. Etiam id nulla ac dolor ullamcorper tincidunt ac accumsan urna. Duis a volutpat velit. Phasellus auctor enim nec ligula rutrum commodo. Pellentesque dignissim feugiat massa, eget rhoncus augue.\n\nDonec sed ipsum ante. Mauris gravida massa vel lectus interdum vehicula. Nullam convallis nulla vitae ex facilisis, ut viverra metus finibus. Nam eu nulla non risus porta elementum. Praesent condimentum mauris sit amet rutrum ullamcorper. Mauris aliquet ut tellus nec volutpat. Sed eleifend eros leo, ac ultricies orci elementum fringilla. Pellentesque aliquet tincidunt est id laoreet. Sed et nisl ligula. Donec bibendum euismod consectetur. Nullam enim tellus, pretium ut lacus ac, faucibus fringilla leo. Curabitur auctor dolor sapien, quis vehicula ipsum molestie sed. In dignissim eros in bibendum tempus." }
          }
        ]
    , description = "RENE YEM"
    , title = "Fly me to the moon 🌕"
    , image = "/static/image-title.jpeg"
    , author = "me"
    }
