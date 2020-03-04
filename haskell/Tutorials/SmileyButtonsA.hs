import MicroBit

pattern:: Signal LED
pattern = lift (\_ -> ShowLED 
    [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."]) (when (buttonA IsPressed))

main :: MicroBit
main = microBit [led pattern]