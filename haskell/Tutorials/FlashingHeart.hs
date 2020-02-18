{--
basic.forever(function () {
    basic.showLeds(`
        . # . # .
        # # # # #
        # # # # #
        . # # # .
        . . # . .
        `)
})
--}

import MicroBit


type Model = Icon

view :: MicroBit ()
view = leds () ". # . # . # # # # # # # # # # . # # # . . . # . ."


view1 :: MicroBit ()
view1 = 
    forever 
        [
            leds () ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
