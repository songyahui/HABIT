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

view ::  MicroBit ()
view  = 
    microbit [
        buttonPressed (onButtonA ()) [
            showleds () ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
    ]
