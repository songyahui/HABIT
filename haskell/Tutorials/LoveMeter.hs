import MicroBit

type Model = Int

data Msg = ProduceRandom | ConsumeRandom Int  

inite :: (Model, Cmd Msg)
inite = ( 0, CmdNone)

update :: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        ProduceRandom -> 
            (model, 
            generate  ConsumeRandom (randomRange 0 10))
        ConsumeRandom randomValue -> 
            (randomValue, CmdNone)

view :: Model -> MicroBit
view model = 
    pin0  [onPressed ProduceRandom] [
            MicroBit.showNumber (model),
            MicroBit.showString "LOVE METER"
        ]

main = element inite view update (\_ -> SubNone)

