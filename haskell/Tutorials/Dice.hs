
{--
input.onGesture(Gesture.Shake, function () {
    basic.showNumber(Math.randomRange(0, 10))
})
basic.forever(function () {
	
})
--}

import MicroBit

type Model = Int

inite :: Model
inite = 0

data Msg = GetRandomNum

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        GetRandomNum -> randomRange 0 10 

view :: Model -> MicroBit
view model = 
    gesture [onShake GetRandomNum] [shownumber model]

main = ivu_FrameWork inite view update