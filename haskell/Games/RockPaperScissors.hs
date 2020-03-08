import MicroBit

pattern:: Sig Pattern
pattern = 
    let a = randomRange 0 3 in 
    (if a ==0 then 
    return $ [  
        " . . # . .", 
        " . . # . .", 
        " . . # . .", 
        " . . # . .", 
        " . . # . ."
    ]
    else if a ==1 then 
    return $ [
        " # . . . .", 
        " . # . . .", 
        " . . # . .", 
        " . . . # .", 
        " . . . . #"
    ]
    else return $ [
        " . . . . #",
        " . . . # .",
        " . . # . .",
        " . # . . .",
        " # . . . ."
    ]
    )

led :: MicroBit
led = showLED pattern