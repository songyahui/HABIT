import MicroBit
import Prelude hiding (map) 

if_b :: MicroBit
if_b = (showLED $ return 
        [". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."])
        >>
        (showLED $ return 
           [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."]
        )

else_b :: MicroBit
else_b = clear >> pause 3000


led :: MicroBit
led = 
    assert (lightLevel .> 0)
    (if lightLevel .>16 then if_b else else_b) 
