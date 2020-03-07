import MicroBit
import Prelude hiding (map)

blink :: Sig Bool
blink = False @> map not (pre blink)
--blink = fold (\a state -> not state) False everySec

led :: MicroBit
led = assert (blink .= True)
      (plot 2 2 blink)