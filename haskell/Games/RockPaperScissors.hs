import MicroBit

{--@ n : Int | n > 0 @--}
type Model = Int 

data Msg = GetRandom | ConsumeRandomValue Int  

inite :: (Model, Cmd Msg)
inite = (0, CmdNone) 

{--@ True -> n : Int | n > 0 @--}
update :: Msg -> Model -> (Model, Cmd Msg) 
update msg model = 
    case msg of 
        GetRandom  -> (model, generate  ConsumeRandomValue (randomRange 0 3))
        ConsumeRandomValue randomValue -> (randomValue, CmdNone)


view :: Model -> MicroBit
view model = 
    gesture [onShake GetRandom] [
        if model == 0  then 
            showLeds  ". . # . . . . # . .. . # . . . . # . . . . # . ."
        else if model == 1 then 
            showLeds "# . . . . . # . . . . . # . . . . . # . . . . . #"
        else 
            showLeds ". . . . # . . . # . . . # . . . # . . . # . . . ."
    ]

main = element inite view update (\_ -> SubNone)