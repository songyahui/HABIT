import MicroBit


type Model = (Int, Bool)

inite :: Model
inite = (0, False)

data Msg = GetMag

update :: Msg -> Model -> Model 
update msg (force, isSwitched) = 
    case msg of 
        GetMag -> 
            let force' = math_abs (magneticForce Strangth) in 
            let isSwitched' = force' > 100 in 
            (force', isSwitched')
                

view :: Model -> MicroBit
view (force, isSwitched) =
    microbit [
        forever [GetMag] []
        ,
        buttonA [onPressed ()] [
            if isSwitched then showstring "B"
            else showstring "A"
        ]
        ,
        buttonB [onPressed ()] [
            if isSwitched then showstring "A"
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