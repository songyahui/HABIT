import MicroBit 

type Model = Int

inite :: Model
inite = 0

data Msg = IncreaseStep

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        IncreaseStep -> model + 1

view :: Model -> MicroBit
view model  = 
    microbit [
        gesture [onShake IncreaseStep] [
            stopAnimation
        ],
        forever [] [
            shownumber model 
        ]
    ]

main = ivu_FrameWork inite view update

{--
let step = 0
input.onGesture(Gesture.Shake, function () {
    step += 1
    led.stopAnimation()
})
basic.forever(function() {
    basic.showNumber(step)
})
step = 0
--}