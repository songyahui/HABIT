import MicroBit

force :: Signal Float 
force = lift _abs (magneticForce Strength)

isSwitched :: Signal Bool
isSwitched = False  @> (lift (> 100) force)

patternA:: Signal LED
patternA = 
    let pattern = lift (\a -> if a then ShowStr "B" else ShowStr "A") isSwitched in 
    pattern <@> (buttonA IsPressed) 

patternB:: Signal LED
patternB = 
    let pattern = lift (\a -> if a then ShowStr "A" else ShowStr "B") isSwitched in 
    pattern <@> (buttonB IsPressed) 
    

main :: MicroBit
main = microBit [led patternA,
                 led patternB]
