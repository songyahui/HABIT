import MicroBit
import Prelude hiding (map)

randomNum :: Sig Int
randomNum = map (\_ -> randomRange 0 10) shake

led :: MicroBit
led = 
    assert (randomNum .< 100)
    showNum randomNum