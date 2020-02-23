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

