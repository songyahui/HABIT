import MicroBit

step :: Sig Int
step = fold (\a num -> if a then num + 1 else num) 0 shake

led :: MicroBit
led = showNum step