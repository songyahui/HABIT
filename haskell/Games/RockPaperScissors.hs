import MicroBit

pattern:: Signal LED
pattern = 
    let a = randomRange 0 3 in 
    return $ ShowLED (if a ==0 then 
    [  
        " . . # . .", 
        " . . # . .", 
        " . . # . .", 
        " . . # . .", 
        " . . # . ."
    ]
    else if a ==1 then 
    [
        " # . . . .", 
        " . # . . .", 
        " . . # . .", 
        " . . . # .", 
        " . . . . #"
    ]
    else [
        " . . . . #",
        " . . . # .",
        " . . # . .",
        " . # . . .",
        " # . . . ."
    ]
    )

main :: MicroBit
main = microBit [led pattern]