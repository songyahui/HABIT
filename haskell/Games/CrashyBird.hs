import MicroBit


type Model = (Int, Int, Int, Int, Int, Int)

inite :: Model 
inite = (0, 2, 300, 0, 0 , 0)

data Msg = None | GoDown | GoUp | TickPlus


update :: Msg -> Model -> Model
update msg (sprite_x, sprite_y, sprite_blink, emptyObstacleY, ticks, index ) = 
    case msg of
        GoDown -> (sprite_x, sprite_y - 1, sprite_blink , emptyObstacleY, ticks, index )
        GoUp -> (sprite_x, sprite_y + 1, sprite_blink , emptyObstacleY, ticks, index )
        TickPlus -> (sprite_x, sprite_y, sprite_blink , emptyObstacleY, ticks + 1, index )


view :: Model -> MicroBit Msg
view (sprite_x, sprite_y, sprite_blink , emptyObstacleY, ticks, index ) =  
    microbit [
        buttonAPressed [GoDown] []
        , buttonBPressed [GoUp] []
        ,forever [TickPlus] [pause [] 1000]
    ] 




{--let ticks = 0
let emptyObstacleY = 0
let obstacles: game.LedSprite[] = []
let index = 0
let bird: game.LedSprite = null
input.onButtonPressed(Button.A, () => {
    bird.change(LedSpriteProperty.Y, -1)
})
input.onButtonPressed(Button.B, () => {
    bird.change(LedSpriteProperty.Y, 1)
})
index = 0
obstacles = []
bird = game.createSprite(0, 2)
bird.set(LedSpriteProperty.Blink, 300)
basic.forever(() => {
    while (obstacles.length > 0 && obstacles[0].get(LedSpriteProperty.X) == 0) {
        obstacles.removeAt(0).delete()
    }
    for (let obstacle2 of obstacles) {
        obstacle2.change(LedSpriteProperty.X, -1)
    }
    if (ticks % 3 == 0) {
        emptyObstacleY = Math.randomRange(0, 4)
        for (let index2 = 0; index2 <= 4; index2++) {
            if (index2 != emptyObstacleY) {
                obstacles.push(game.createSprite(4, index2))
            }
        }
    }
    for (let obstacle3 of obstacles) {
        if (obstacle3.get(LedSpriteProperty.X) == bird.get(LedSpriteProperty.X) && obstacle3.get(LedSpriteProperty.Y) == bird.get(LedSpriteProperty.Y)) {
            game.gameOver()
        }
    }
    ticks += 1
    basic.pause(1000)
})
--}