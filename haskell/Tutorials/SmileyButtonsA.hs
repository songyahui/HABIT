{--
input.onButtonPressed(Button.A, function () {
    basic.showLeds(`
        . # . # .
        # # # # #
        # # # # #
        . # # # .
        . . # . .
        `)
})
basic.forever(function () {
	
})
--}

import MicroBit


type Model = Icon


view :: Model -> MicroBit ()
view model = 
    microbit [
        buttonPressed (onButtonA ()) [
            leds () ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
    ]
