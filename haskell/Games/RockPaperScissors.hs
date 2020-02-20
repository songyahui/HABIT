{--
let num = 0
input.onGesture(Gesture.Shake, function () {
    num = Math.randomRange(0, 3)
    if (num == 0) {
        basic.showLeds(`
            . . # . .
            . . # . .
            . . # . .
            . . # . .
            . . # . .
            `)
    } else if (num == 1) {
        basic.showLeds(`
            # . . . .
            . # . . .
            . . # . .
            . . . # .
            . . . . #
            `)
    } else {
        basic.showLeds(`
            . . . . #
            . . . # .
            . . # . .
            . # . . .
            # . . . .
            `)
    }
})
basic.forever(function () {
	
})
--}

import MicroBit

{--@ n : Int | n > 0 @--}
type Model = Int 


inite :: Model
inite = 0 

data Msg = None | GetRandom

{--@ True -> n : Int | n > 0 @--}
update :: Msg -> Model -> Model 
update msg model = 
    case msg of 
        None -> model
        GetRandom  -> randomRange 0 3


view :: Model -> MicroBit
view model = 
    gesture [onShake GetRandom] [
        if model == 0  then 
            showLeds  ". . # . . . . # . .. . # . . . . # . . . . # . ."
        else if model == 1 then 
            showLeds "# . . . . . # . . . . . # . . . . . # . . . . . #"
        else 
            showLeds ". . . . # . . . # . . . # . . . # . . . # . . . ."
    ]

main = frameWork inite view update