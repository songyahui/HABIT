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

main  = 
    microbit [
        buttonAB [onPressed ()] [
            showLeds ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
    ]