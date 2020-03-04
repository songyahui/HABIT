import MicroBit

randomNum :: Signal LED
randomNum = lift (\a -> ShowNum (randomRange 0 10) ) (when onShake)

main = microBit [led randomNum]