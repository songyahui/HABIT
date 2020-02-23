import MicroBit


data Model = Model {force:: Int, isSwitched::Bool}

inite :: Model
inite = Model 0 False

data Msg = GetMag

update :: Msg -> Model -> Model 
update msg model  = 
    case msg of 
        GetMag -> 
            let force' = math_abs (magneticForce Strangth) in 
            let isSwitched' = force' > 100 in 
            model <^> [force @>force', isSwitched @> isSwitched']
                

view :: Model -> MicroBit
view model =
    microbit [
        forever [GetMag] [],
        buttonA [onPressed ()] [
            if model # isSwitched then showstring "B"
            else showstring "A"
        ],
        buttonB [onPressed ()] [
            if model # isSwitched then showstring "A"
            else showstring "B"
        ]

    ]

main = ivu_FrameWork inite view update

