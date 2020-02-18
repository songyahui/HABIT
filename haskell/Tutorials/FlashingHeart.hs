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
view = showstring () ". # . # . # # # # # # # # # # . # # # . . . # . ."


view1 :: MicroBit ()
view1 = 
    forever 
        [
            showstring () ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
