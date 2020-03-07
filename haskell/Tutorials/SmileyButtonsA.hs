import MicroBit
import Prelude hiding (map)

pattern:: Sig Pattern 
pattern = map (\_ ->  
    [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."])  (buttonA IsPressed)

led :: MicroBit
led = showLED pattern