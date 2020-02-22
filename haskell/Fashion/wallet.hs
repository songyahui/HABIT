import MicroBit 

main = 
    microbit [
        forever [] [
            if lightLevel > 16 then 
                showLeds "# # . # # # # . # # . # # # . . # . # . . # . # ."
                >> showLeds ". . # . . . . # . . # . . . # # . # . # # . # . #"
            else 
                clearScreen,
                pause 3000

        ]
    ]

{--
basic.forever(() => {
    if (input.lightLevel() > 16) {
        basic.showLeds(`
            # # . # #
            # # . # #
            . # # # .
            . # . # .
            . # . # .
            `)
        basic.showLeds(`
            . . # . .
            . . # . .
            # . . . #
            # . # . #
            # . # . #
            `)
    } else {        
        // clear screen and wait
        basic.clearScreen()
        basic.pause(3000)
    }
})
--}