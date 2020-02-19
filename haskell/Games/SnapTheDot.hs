import MicroBit

type Model = (Sprite)

inite :: Model 
inite = (2, 2)

data Msg = Move

update :: Msg -> Model -> Model
update msg (x, y) = 
    case msg of 
        Move -> spritemove (x, y)  1 

view :: Model -> MicroBit Msg
view (x, y) = 
    microbit [
        forever [Move] [
            ifOnEdgeBounce []
            , pause [] 100
            ] 
        , buttonAPressed [] [
            addScore [] 1
            , gameOver []
        ]
    ]

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