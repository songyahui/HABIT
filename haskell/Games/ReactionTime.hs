import MicroBit

data Model = Model {
    start :: Int, 
    end :: Int, 
    false_start :: Bool, 
    running :: Bool, 
    random1 ::Int, 
    random2 :: Int, 
    random3 :: Int, 
    led :: String}

inite :: Model 
inite = Model 0 0 False False 0 0 0 emptyLeds

data Msg = P0Pressed | P1Pressed | P2Pressed  

update :: Msg -> Model -> Model
update msg model = 
    case msg of
        P0Pressed -> 
            let start' = runningTime in 
            let random1' = randomRange 0 2000 in 
            let random2' = randomRange 0 4 in 
            let random3' = randomRange 0 4 in 
            model <^> [start @> start', running @> True, random1 @> random1', random2 @> random2', random3 @> random3']
        P1Pressed -> 
            if model # running then
                model <^> [running @> False, led @> "# # . . .# # . . .# # . . .# # . . .# # . . ."]
            else model <^> [running @> True, led @> ". . . . .# . # . .. # . . .# . # . .. . . . ."]
        P2Pressed -> 
            if model # running then
                model <^> [running @> False, led @> ". . . # #. . . # #. . . # #. . . # #. . . # #"]
            else model <^> [running @> True, led @> ". . . . .. . # . #. . . # .. . # . #. . . . ."]

view :: Model -> MicroBit
view model = 
    microbit [
        pin0 [onPressed P0Pressed] [
              shownumber 3, 
              shownumber 2, 
              shownumber 1, 
              clearScreen, 
              pause (1000 + (model # random1)), 
              if model # false_start == True then 
                   showLeds emptyLeds
              else 
                   stopAnimation,
                   clearScreen,
                   plot (model # random2) (model #random3)
        ],
        pin1 [onPressed P1Pressed] [
            if model # running == False then 
                showLeds (model # led)
            else
                showLeds (model #led), pause 1000,
                pause 1000,
                shownumber (model #end - model #start)
        ], 
        pin2 [onPressed P2Pressed] [
            if model # running == False then 
                showLeds (model # led)
            else
                showLeds (model #led), pause 1000,
                pause 1000,
                shownumber (model #end - model #start)
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