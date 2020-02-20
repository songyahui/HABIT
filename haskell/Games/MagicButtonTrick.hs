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

{--
let force = 0;
let isSwitched = false;
basic.forever(() => {
    force = Math.abs(input.magneticForce(Dimension.Strength));
    isSwitched = force > 100
})

input.onButtonPressed(Button.A, () => {
    if (isSwitched) {
        basic.showString("B")
    } else {
        basic.showString("A")
    }
})
input.onButtonPressed(Button.B, () => {
    if (isSwitched) {
        basic.showString("A")
    } else {
        basic.showString("B")
    }
})
--}