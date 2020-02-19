
{--
input.onGesture(Gesture.Shake, function () {
    basic.showNumber(Math.randomRange(0, 10))
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
    gestureonShake [GetRandomNum] [showstring [] (fromInt model)]
    