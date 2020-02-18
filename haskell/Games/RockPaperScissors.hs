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

type Model = Int 

inite :: Model
inite = 0

data Msg = None | GetRandom Int

update :: Msg -> Model -> Model 
update msg model = 
    case msg of 
        None -> model
        GetRandom n  -> n


view :: Model -> MicroBit Msg
view model = 
    gesture (onShake (GetRandom model)) [
        if model == 0  then 
            showleds None ". . # . . . . # . .. . # . . . . # . . . . # . ."
        else if model == 1 then 
            showleds None "# . . . . . # . . . . . # . . . . . # . . . . . #"
        else 
            showleds None ". . . . # . . . # . . . # . . . # . . . # . . . ."
    ]