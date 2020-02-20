{--
input.onPinPressed(TouchPin.P0, function () {
    basic.showNumber(Math.randomRange(0, 10))
    basic.showString("LOVE METER")
})
basic.forever(function () {
	
})
--}
import MicroBit


type Model = Int

inite = 0

data Msg = GetRandomNum

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        GetRandomNum -> randomRange 0 10 

view :: Model -> MicroBit
view model = 
    microbit [
        pin0  [onPressed GetRandomNum] [
            shownumber  model
            ,showstring "LOVE METER"
        ]
    ]

main = ivu_FrameWork inite view update