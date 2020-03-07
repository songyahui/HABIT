import MicroBit

pattern:: Signal LED
pattern = 
    let a = return $ ShowIcon SmallDiamond in 
    let b = return $ ShowIcon Diamond in 
    let c = return $ ShowIcon (if randomBoolean then Yes else No) in 
    a >> b >> a >> b >> c

main :: MicroBit
main = microBit [led pattern]