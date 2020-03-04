import MicroBit

pattern:: Signal LED
pattern = return $ ShowLED 
    [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."]

main :: MicroBit
main = microBit [led pattern]