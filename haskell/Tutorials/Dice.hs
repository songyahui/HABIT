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
    gesture [onShake ProduceRandomValue] [shownumber (model # randomNum )]

main = element inite view update