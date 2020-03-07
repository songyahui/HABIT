import MicroBit
import Prelude hiding (map)

sig :: Sig Bool
sig = pin0 IsPressed

randomNum :: Sig Int
randomNum = map (\_ -> randomRange 0 10) sig

str :: Sig String
str = map (\_ -> ("LOVE METER")) sig 

led :: MicroBit 
led = showNum randomNum >> showStr str
    

