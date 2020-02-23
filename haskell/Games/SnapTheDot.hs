import MicroBit

type Model = Sprite

inite :: Model 
inite = (2, 2)

view :: Model -> MicroBit
view (x, y) = 
    microbit [
        buttonA [] [
            if x == 2 then addScore 1
            else gameOver
        ],
        forever [] [
            spritemove 1, 
            pause 100, 
            ifOnEdgeBounce
        ] 
    ]

main = iv_FrameWork inite view

