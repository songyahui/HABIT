{--
input.onButtonPressed(Button.AB, function () {
    basic.showLeds(`
        # # . # #
        # . . . #
        . . . . .
        . # . # .
        . # # # .
        `)
})
basic.forever(function () {
	
})
--}

import MicroBit



view :: MicroBit ()
view = 
    microbit [
        buttonPressed (onButtonAB ()) [
            showstring () ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
    ]