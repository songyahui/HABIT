import MicroBit


data Model = Model {randomNum::Int}

data Msg = ProduceRandomValue | ConsumeRandomValue Int  

inite :: (Model, Maybe Msg)
inite = (Model 0, Nothing)

update :: Msg -> Model -> (Model, Maybe Msg)
update msg model = 
    case msg of 
        ProduceRandomValue -> (model, Just $ generate  ConsumeRandomValue (randomRange 0 10))
        ConsumeRandomValue randomValue -> 
            (model <^> [randomNum @> randomValue], Nothing)

view :: Model -> MicroBit
view model = 
    pin0  [onPressed ProduceRandomValue] [
            shownumber (model # randomNum),
            showstring "LOVE METER"
        ]

main = element inite view update

