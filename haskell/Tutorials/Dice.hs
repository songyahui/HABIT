import MicroBit

type Model = Int

data Msg = ProduceValue | ConsumeValue Int  

inite :: (Model, Cmd Msg)
inite = (0, CmdNone)

update :: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        ProduceValue -> 
            (model, 
            generate ConsumeValue (randomRange 0 10))
        ConsumeValue randomValue -> 
            (randomValue, 
            CmdNone)

view :: Model -> MicroBit
view model = 
    gesture [onShake ProduceValue] 
            [MicroBit.showNumber model]

main = element inite view update (\_-> SubNone)