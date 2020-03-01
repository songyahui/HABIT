import MicroBit

data Model = Model {
    sprite_x :: Int, 
    sprite_y :: Int, 
    sprite_blink :: Int,
    emptyObstacleY :: Int,
    ticks :: Int,
    index :: Int,
    obstacles :: Game_LedSprite}

data Msg = None | GoDown | GoUp | TickPlus Posix | ConsumeRandom Int

inite :: (Model, Cmd Msg) 
inite = (Model 0 2 300 0 0 0 [], CmdNone)

update :: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of
        GoDown -> (model <^> [sprite_y @> (model # sprite_y -1)] , CmdNone)
        GoUp -> (model <^> [sprite_y @> (model # sprite_y + 1)] , CmdNone)
        TickPlus time -> 
            let helper lio = (case lio of 
                    [] -> [] 
                    (x, y):xs -> if x==0 then helper xs else xs )
            in 
            let obstacles_ = helper (model # obstacles) in 
            let obstacles' = foldr (\ (x, y) acc ->  (x-1, y) : acc ) [] obstacles_ in 
            let ticks' = (model # ticks) + 1 in 
            (model <^> [ticks @> ticks', obstacles @> obstacles'], generate ConsumeRandom (randomRange 0 4))
        ConsumeRandom randomValue ->
            let obstacles' = foldr (\x acc -> if x /= randomValue then (4, x): acc else acc) (model # obstacles) [0, 1, 2, 3, 4] in 
        
            (model <^> [obstacles @> obstacles'], CmdNone)


subscriptions :: Model -> Sub Msg
subscriptions model =
  every 1000 TickPlus
        
       
view :: Model -> MicroBit
view model =  
    microbit [
        buttonA [onPressed GoDown] []
        , buttonB [onPressed GoUp] []
        , forever [] [
            let result = foldr (\(x,y) acc-> 
                    if x == (model # sprite_x) && y == (model # sprite_y) then True else (acc || False)) 
                    False (model # obstacles) in 
            if result then gameOver 
            else continue]
    ] 

main = element inite view update subscriptions

