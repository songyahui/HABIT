import MicroBit

pattern:: Signal LED
pattern = lift (\_ -> ShowLED 
    [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."]) (when (buttonAB IsPressed))

main :: MicroBit
main = microBit [led pattern]