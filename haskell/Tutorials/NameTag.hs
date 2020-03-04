import MicroBit

pattern:: Signal LED
pattern = 
    let hello = return $ ShowStr "Hello!" in 
    let test = return $ ShowStr "Hello!" in 
    hello >> test

main :: MicroBit
main = microBit [led pattern]
