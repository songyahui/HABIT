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


main :: MicroBit
main = showstring ". # . # . # # # # # # # # # # . # # # . . . # . ."

