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

main  = 
    microbit [
        buttonA [onPressed ()] [
            showLeds ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
    ]
