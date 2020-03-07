import MicroBit

patternA:: Signal LED
patternA = 
    return (ShowStr "B") when isSwitched 
    
    return $ ShowLED 
    [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."]

main :: MicroBit
main = microBit [led patternA,
                 led patternB]