import MicroBit


data Model = Model {b::Bool} 

inite :: (Model, Cmd Msg)
inite = (Model True, CmdNone)

data Msg = GetRandomBool | ConsumeRandomBool Bool 

update :: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        GetRandomBool -> (model, generate ConsumeRandomBool randomBoolean)
        ConsumeRandomBool randomValue -> 
            (model <^> [b @> randomValue], CmdNone)
     
view :: Model -> MicroBit
view model = 
    buttonA [onPressed GetRandomBool] [
            showicon SmallDiamond, 
            showicon Diamond, 
            showicon SmallDiamond, 
            showicon Diamond, 
            if model # b then showicon Yes else showicon No
    ]

main = element inite view update (\_ -> SubNone)