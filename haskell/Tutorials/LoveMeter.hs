import MicroBit


showPattern :: Signal LED
showPattern = 
    let sig = when (pin0 IsPressed) in 
    let num = (lift (\_ -> ShowNum (randomRange 0 10)) sig) in
    let string = (lift (\_ -> ShowStr ("LOVE METER")) sig) in
    num >> string
    
main = microBit[led showPattern]

