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


{--
let sprite: game.LedSprite = null
input.onButtonPressed(Button.A, function () {
    if (sprite.get(LedSpriteProperty.X) == 2) {
        game.addScore(1)
    } else {
        game.gameOver()
    }
})
sprite = game.createSprite(2, 2)
basic.forever(function () {
    sprite.move(1)
    basic.pause(100)
    sprite.ifOnEdgeBounce()
})

--}