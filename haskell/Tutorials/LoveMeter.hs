import MicroBit


data Model = Model {randomNum::Int}

inite :: Model
inite = Model 0

data Msg = GetRandomNum

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        GetRandomNum -> model <^> [ randomNum @> randomRange 0 10]

view :: Model -> MicroBit
view model = 
    microbit [
        pin0  [onPressed GetRandomNum] [
            shownumber (model # randomNum),
            showstring "LOVE METER"
        ]
    ]

main = ivu_FrameWork inite view update