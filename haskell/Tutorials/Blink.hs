import MicroBit

blink :: Signal Bool
blink = foldP (\a state -> not state) False everySec

main :: MicroBit
main = microBit [plot 2 2 blink]