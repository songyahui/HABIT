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