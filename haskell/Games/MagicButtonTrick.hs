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
    


force :: Sig Int
force = abs (magneticForce Strength )

isSwitched :: Sig Bool
isSwitched = map (> 100) force

a :: Sig String
a = map (\a -> if a then "B" else "A") isSwitched

b= 
led :: MicroBit
led = par [

    ]