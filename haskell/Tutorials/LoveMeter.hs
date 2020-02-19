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

data Msg = GetRandomNum

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        GetRandomNum -> randomRange 0 10 

view :: Model -> MicroBit Msg
view model = 
    microbit [
        pin0Pressed [GetRandomNum] [
            showstring [] (fromInt model)
            ,showstring [] ("LOVE METER")
        ]
    ]