import MicroBit
import Prelude hiding (map)

blink :: Sig Bool
blink = 
      assert (False @> map not (pre blink))
      (fold (\a acc -> if a then not acc else acc ) False everySec)

pos :: Sig Sprite
pos = return (2, 2)

--blink = fold (\a state -> not state) False everySec

led :: MicroBit
led = assert (blink .= True)
      (plot pos blink)