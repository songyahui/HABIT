import MicroBit
import Prelude hiding (map)

force :: Sig Int 
force = map _abs (magneticForce Strength)

isSwitched :: Sig Bool
isSwitched = map (> 100) force

onbuttonA :: Sig String
onbuttonA = map_2 (\a b -> if a && b then "B" else "A") (isSwitched) (buttonA IsPressed)

onbuttonB :: Sig String
onbuttonB = map_2 (\a b -> if a && b then "A" else "B") (isSwitched) (buttonB IsPressed)

led :: MicroBit
led = par [showStr onbuttonA, showStr onbuttonB]