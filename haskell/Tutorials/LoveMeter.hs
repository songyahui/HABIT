import MicroBit


data Model = Model {randomNum::Int}

data Msg = ProduceRandomValue | ConsumeRandomValue Int  

inite :: (Model, Cmd Msg)
inite = (Model 0, CmdNone)

update :: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        ProduceRandomValue -> (model, generate  ConsumeRandomValue (randomRange 0 10))
        ConsumeRandomValue randomValue -> 
            (model <^> [randomNum @> randomValue], CmdNone)

view :: Model -> MicroBit
view model = 
    pin0  [onPressed ProduceRandomValue] [
            shownumber (model # randomNum),
            showstring "LOVE METER"
        ]

main = element inite view update (\_ -> SubNone)

