import MicroBit

step :: Signal LED
step = fold (\a num -> if a then num + 1 else num) 0 shake



main :: MicroBit
main = microBit [led step]