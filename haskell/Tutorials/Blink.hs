import MicroBit
import Prelude hiding (map)

blink :: Sig Bool
blink = 
      assert (False @> map not (pre blink))
      (fold (\_ acc -> not acc  ) False everySec)

--blink = fold (\a state -> not state) False everySec

led :: MicroBit
led = assert (blink .= True)
      (plot 2 2 blink)