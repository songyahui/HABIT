import MicroBit
import Prelude hiding (map)

pattern:: Sig Pattern 
pattern = map (\_ ->  
    [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."])  (buttonAB IsPressed)

led :: MicroBit
led = showLED pattern