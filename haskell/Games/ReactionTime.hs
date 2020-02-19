import MicroBit


type Model = (Int, Int, Bool, Bool)

data Msg = P0Pressed | Unknown 

update :: Msg -> Model -> Model
update msg (start, end, false_start, running) = 
    case msg of
        P0Pressed -> let 

view :: Model -> MicroBit Msg
view (start, end, false_start, running) = 
    microbit [
        pin0Pressed [P0Pressed] [

        ]

    ]




{--let start = 0
let end = 0
let false_start = false
let running = false
input.onPinPressed(TouchPin.P0, () => {
    basic.showNumber(3)
    basic.showNumber(2)
    basic.showNumber(1)
    basic.clearScreen()
c
    basic.pause(1000 + Math.randomRange(0, 2000))
    if (!(false_start)) {
        start = input.runningTime()
        running = true
        led.stopAnimation()
        basic.clearScreen()
        led.plot(Math.randomRange(0, 4), Math.randomRange(0, 4))
    }
})
input.onPinPressed(TouchPin.P1, () => {
    if (running) {
        running = false
        end = input.runningTime()
        basic.showLeds(`
            # # . . .
            # # . . .
            # # . . .
            # # . . .
            # # . . .
            `)
        basic.pause(1000)
        basic.showNumber(end - start)
    } else {
        false_start = true
        basic.showLeds(`
            . . . . .
            # . # . .
            . # . . .
            # . # . .
            . . . . .
            `)
    }
})
input.onPinPressed(TouchPin.P2, () => {
    if (running) {
        running = false
        end = input.runningTime()
        basic.showLeds(`
            . . . # #
            . . . # #
            . . . # #
            . . . # #
            . . . # #
            `)
        basic.pause(1000)
        basic.showNumber(end - start)
    } else {
        false_start = true
        basic.showLeds(`
            . . . . .
            . . # . #
            . . . # .
            . . # . #
            . . . . .
            `)
    }
})

--}