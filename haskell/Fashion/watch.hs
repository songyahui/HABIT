import MicroBit
import Prelude hiding (map) 

reset :: Sig Bool
reset = buttonA IsPressed

increase :: Sig Int
increase = fold (\_ acc -> acc + 1) 0 shake

number :: Sig Int
number = 
    if (reset .= True) then Sig 0
    else increase
    
led :: MicroBit
led = showNum number