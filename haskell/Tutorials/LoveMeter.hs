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

data Msg = None | GetRandomNum

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        None -> model 
        GetRandomNum -> randomRange 0 10 

view :: Model -> MicroBit Msg
view model = 
    microbit [
        pinPressed (onPin0 GetRandomNum) [
            showstring None (fromInt model)
            ,showstring None ("LOVE METER")
        ]
    ]