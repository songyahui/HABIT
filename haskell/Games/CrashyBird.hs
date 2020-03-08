import MicroBit
import Prelude hiding (map)

data Move = Up | Down | Stay

move :: Sig Move
move = map_2 (\a b -> if a then Down else if b then Up else Stay) (buttonA IsPressed) (buttonB IsPressed)

bird :: Sig Sprite
bird = fold (\m (x, y) -> case m of 
        Up -> (x, y+1)
        Down -> (x, y-1)
        Stay -> (x, y)
    ) (0, 2) move

blink :: Sig Bool
blink = fold (\a acc -> if a then not acc else acc) False (millisecond 300)

ticks :: Sig Int 
ticks  = fold (\a acc -> acc + 1) 0 everySec

newobstacle :: LedSprite
newobstacle = let ram = randomRange 0 4 in 
     foldr (\a acc -> if a/= ram then acc ++ [(4, a)] else acc ) [] [0, 1, 2, 3]

obstacles :: Sig LedSprite
obstacles = 
    let del0 obs = Prelude.filter (\(x, y) -> x /= 0) obs in 
    fold (\t acc -> if t `mod` 3 ==0 then acc ++ newobstacle else del0 acc) [] ticks

show:: MicroBit
show = par [
        plot bird blink ,
        showLedSprite obstacles
    ]