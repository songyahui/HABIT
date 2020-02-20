import MicroBit


data Model = Model {
    sprite_x :: Int, 
    sprite_y :: Int, 
    sprite_blink :: Int,
    emptyObstacleY :: Int,
    ticks :: Int,
    index :: Int,
    obstacles :: [(Int, Int)]}

inite :: Model 
inite = Model 0 2 300 0 0 0 []

data Msg = None | GoDown | GoUp | TickPlus

update :: Msg -> Model -> Model
update msg model = 
    case msg of
        GoDown -> model <^> [sprite_y @> (model # sprite_y -1)] 
        GoUp -> model <^> [sprite_y @> (model # sprite_y + 1)] 
        TickPlus -> 
            let helper lio = (case lio of 
                    [] -> [] 
                    (x, y):xs -> if x==0 then helper xs else xs )
            in 
            let obstacles_ = helper (model # obstacles) in 
            let obstacles' = foldr (\ (x, y) acc ->  (x-1, y) : acc ) []obstacles_ in 
            let obstacles'' = (if True then 
                    let emptyObstacleY = randomRange 0 4 in
                    foldr (\x acc -> (4, x): acc) obstacles' [0, 1, 2, 3, 4] 
                else obstacles') in 
            let ticks' = (model # ticks) + 1 in 
            model <^> [ticks @> ticks', obstacles @> obstacles'']
        
       
view :: Model -> MicroBit
view model =  
    microbit [
        buttonA [onPressed GoDown] []
        , buttonB [onPressed GoUp] []
        , forever [ TickPlus] [
            let result = foldr (\(x,y) acc-> 
                    if x == (model # sprite_x) && y == (model # sprite_y) then True else (acc || False)) 
                    False (model # obstacles) in 
            if result then gameOver 
            else pause 1000]
    ] 

main = ivu_FrameWork inite view update


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