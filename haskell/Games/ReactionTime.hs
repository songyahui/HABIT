import MicroBit

type Model = (Int, Int, Bool, Bool, Int, Int, Int, String)

inite :: Model 
inite = (0,0,False, False, -1, -1, -1, emptyLeds)

data Msg = P0Pressed | P1Pressed | P2Pressed  


update :: Msg -> Model -> Model
update msg (start, end, false_start, running, random1, random2, random3, led)= 
    case msg of
        P0Pressed -> 
            let start' = runningTime in 
            let ramdom1' = randomRange 0 2000 in 
            let ramdom2' = randomRange 0 4 in 
            let ramdom3' = randomRange 0 4 in 
            (start', end, false_start, True, ramdom1', ramdom2', ramdom3', led)
        P1Pressed -> 
            if running then
                (start, runningTime, false_start, False, random1, random2, random3, "# # . . .# # . . .# # . . .# # . . .# # . . .")
            else (start, end, True, running, random1, random2, random3, ". . . . .# . # . .. # . . .# . # . .. . . . .")
        P2Pressed -> 
            if running then
                (start, runningTime, false_start, False, random1, random2, random3, ". . . # #. . . # #. . . # #. . . # #. . . # #")
            else (start, end, True, running, random1, random2, random3, ". . . . .. . # . #. . . # .. . # . #. . . . .")

view :: Model -> MicroBit
view (start, end, false_start, running, random1, random2, random3, led) = 
    microbit [
        pin0 [onPressed P0Pressed] [
              shownumber 3
            , shownumber 2 
            , shownumber 1
            , clearScreen 
            , pause (1000 + random1)
            , if false_start == False then 
                   stopAnimation
                >> clearScreen
                >> plot random2 random3
            else showLeds emptyLeds
        ]
        ,
        pin1 [onPressed P1Pressed] [
            if running then 
              showLeds led
            >> pause 1000 
            >> shownumber (end - start)
            else showLeds led
        ]
        , 
        pin2 [onPressed P2Pressed] [
            if running then 
              showLeds led
            >> pause 1000 
            >> shownumber (end - start)
            else showLeds led
        ]
    ]

main = ivu_FrameWork inite view update

{--
let start = 0
let end = 0
let false_start = false
let running = false
input.onPinPressed(TouchPin.P0, () => {
    basic.showNumber(3)
    basic.showNumber(2)
    basic.showNumber(1)
    basic.clearScreen()

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