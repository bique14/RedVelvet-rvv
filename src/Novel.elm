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



-- Mockup


type alias Member =
    { name : String

    -- todo : status
    , image : String
    }


irene : Member
irene =
    { name = "rrene"
    , image = "/static/irene-1.jpg"
    }


joy : Member
joy =
    { name = "joyaaaaaa."
    , image = "/static/joy.jpeg"
    }


yeri : Member
yeri =
    { name = "nongyem"
    , image = "/static/yeri.jpeg"
    }


seulgi : Member
seulgi =
    { name = "gii"
    , image = "/static/seulgi-1.png"
    }


wendy : Member
wendy =
    { name = "wenday"
    , image = "/static/wendy-1.jpeg"
    }


init : Model
init =
    { novel =
        [ { image = "/static/chapter-image-2.jpeg"
          , chapter = 1
          , title = "To the moon and back 🌕"
          , description = "- Light me up -"
          , body =
                Chat
                    { data =
                        [ { text_ = "เค้กที่มีสีแดงเข้ม (4)"
                          , name = Nothing
                          , image = Nothing
                          , position = Center
                          }
                        , { text_ = "07:54"
                          , name = Nothing
                          , image = Nothing
                          , position = Center
                          }
                        , { text_ = "พวกมึงง ไปผับกันไหมคืนนี้"
                          , name = Just joy.name
                          , image = Just joy.image
                          , position = Left
                          }
                        , { text_ = "ใครไปบ้าง"
                          , name = Just irene.name
                          , image = Just irene.image
                          , position = Right
                          }
                        , { text_ = "ตอนนี้มี 16 คนแล้ว ขาดอีก 2 คน"
                          , name = Just joy.name
                          , image = Just joy.image
                          , position = Left
                          }
                        , { text_ = "ทำไมไปเยอะจังวะ"
                          , name = Just yeri.name
                          , image = Just yeri.image
                          , position = Left
                          }
                        , { text_ = "ก็เขาบอกว่าต่ำกว่า 18 ห้ามเข้า"
                          , name = Just joy.name
                          , image = Just joy.image
                          , position = Left
                          }
                        , { text_ = "👍"
                          , name = Just irene.name
                          , image = Just irene.image
                          , position = Right
                          }
                        , { text_ = "อ่า"
                          , name = Just yeri.name
                          , image = Just yeri.image
                          , position = Left
                          }
                        , { text_ = "555+"
                          , name = Just seulgi.name
                          , image = Just seulgi.image
                          , position = Left
                          }
                        , { text_ = "wenday left the group."
                          , name = Nothing
                          , image = Nothing
                          , position = Center
                          }
                        ]

                    -- Reminder : If chats.length == data.length -> END CHAPTER
                    , chats = []
                    }
          }
        , { image = "/static/chapter-image-2.jpeg"
          , chapter = 2
          , title = "To the moon and back 🌕"
          , description = "- In & Out -"
          , body =
                Chat
                    { data =
                        [ { text_ = "เค้กที่มีสีแดงเข้ม (4)"
                          , name = Nothing
                          , image = Nothing
                          , position = Center
                          }
                        , { text_ = "รู้ไหม ว่าตัวอักษรภาษาอังกฤษมีกี่ตัว"
                          , name = Just wendy.name
                          , image = Just wendy.image
                          , position = Left
                          }
                        , { text_ = "26 ตัวดิ"
                          , name = Just irene.name
                          , image = Just irene.image
                          , position = Right
                          }
                        , { text_ = "ผิด 21 ตัวตะหาก"
                          , name = Just wendy.name
                          , image = Just wendy.image
                          , position = Left
                          }
                        , { text_ = "มึงหยุด!!!!"
                          , name = Just seulgi.name
                          , image = Just seulgi.image
                          , position = Left
                          }
                        , { text_ = "ได้ยังไง ต้อง 26 ตัวสิ"
                          , name = Just irene.name
                          , image = Just irene.image
                          , position = Right
                          }
                        , { text_ = "ก็ H E A R T เราให้เธอไปแล้วไง"
                          , name = Just wendy.name
                          , image = Just wendy.image
                          , position = Left
                          }
                        , { text_ = "😳"
                          , name = Just wendy.name
                          , image = Just wendy.image
                          , position = Left
                          }
                        , { text_ = "คือพวกกุก้ยังอยู่ในกลุ่มไง"
                          , name = Just joy.name
                          , image = Just joy.image
                          , position = Left
                          }
                        , { text_ = "เห้อ"
                          , name = Just yeri.name
                          , image = Just yeri.image
                          , position = Left
                          }
                        ]

                    -- Reminder : If chats.length == data.length -> END CHAPTER
                    , chats = []
                    }
          }
        , { image = "/static/chapter-image-2.jpeg"
          , chapter = 3
          , title = "To the moon and back 🌕"
          , description = "- Blue lemonade -"
          , body =
                Story
                    { text_ = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec faucibus, \nnisi non lobortis condimentum, ex elit vestibulum dui, ac hendrerit libero magna et risus. Proin ac dolor efficitur, porttitor tellus imperdiet, aliquet neque. Sed pretium est magna, ac accumsan tellus consequat id. Nunc orci libero, finibus id sapien nec, sagittis tincidunt est. Proin vehicula, erat non scelerisque pretium, justo massa molestie orci, sit amet tristique justo justo id mauris. Mauris bibendum quam ultrices, vestibulum est ut, faucibus augue. Maecenas libero mauris, aliquet nec dictum mattis, tincidunt at purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor neque id dui accumsan suscipit. In enim nulla, semper vel arcu vel, placerat ultrices augue. Etiam suscipit nunc ut interdum porttitor. Quisque dignissim quam vel nunc placerat volutpat. Donec arcu nunc, pulvinar at dignissim et, vehicula nec massa. Phasellus tempor arcu leo, quis commodo enim pharetra sed. Suspendisse nec ipsum tellus.\n\nMaecenas maximus ac quam ac laoreet. Aenean interdum nibh ut molestie placerat. Suspendisse mollis libero lorem, elementum ultricies ligula ultrices quis. Pellentesque a nisi tellus. Praesent congue neque vel blandit luctus. In pretium risus erat, et eleifend sem placerat ac. Sed ullamcorper quis metus nec euismod. Maecenas convallis felis bibendum felis blandit, vel lacinia erat rhoncus. Duis consectetur consequat erat, nec sollicitudin diam rutrum eget. Nam condimentum venenatis orci sit amet tempus. Proin mattis odio nec bibendum semper. Duis viverra metus lectus, vitae sollicitudin leo viverra vel. Suspendisse ac nisi eget felis sagittis malesuada. Curabitur pellentesque elit nec justo iaculis scelerisque. Quisque egestas enim eget orci accumsan, sed pretium odio ornare. Phasellus fringilla ante sit amet diam consectetur, quis sodales neque sagittis.\n\nProin vitae egestas mauris, blandit scelerisque urna. Vivamus finibus aliquet lorem ac scelerisque. Etiam libero purus, sodales a ligula in, mollis sagittis justo. Nullam interdum a lectus sed volutpat. Sed malesuada mi elit, ac consequat purus sagittis a. Quisque non est molestie, mollis ex facilisis, fermentum eros. Curabitur eu accumsan lectus. Donec euismod dolor mollis enim tincidunt imperdiet.\n\nDonec et sodales diam, ac fringilla sem. Maecenas facilisis molestie lorem id suscipit. Phasellus eget placerat nisi. Aliquam vitae metus ut tortor tempor dictum id ac odio. Proin vel tristique mi, eu dictum ante. Praesent id ipsum velit. Etiam id nulla ac dolor ullamcorper tincidunt ac accumsan urna. Duis a volutpat velit. Phasellus auctor enim nec ligula rutrum commodo. Pellentesque dignissim feugiat massa, eget rhoncus augue.\n\nDonec sed ipsum ante. Mauris gravida massa vel lectus interdum vehicula. Nullam convallis nulla vitae ex facilisis, ut viverra metus finibus. Nam eu nulla non risus porta elementum. Praesent condimentum mauris sit amet rutrum ullamcorper. Mauris aliquet ut tellus nec volutpat. Sed eleifend eros leo, ac ultricies orci elementum fringilla. Pellentesque aliquet tincidunt est id laoreet. Sed et nisl ligula. Donec bibendum euismod consectetur. Nullam enim tellus, pretium ut lacus ac, faucibus fringilla leo. Curabitur auctor dolor sapien, quis vehicula ipsum molestie sed. In dignissim eros in bibendum tempus." }
          }
        ]
    , description = "WENRENE"
    , title = "To the moon and back 🌕"
    , image = "/static/wenrene.jpg"
    , author = "me"
    }
