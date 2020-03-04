import MicroBit

mesg :: Signal RADIO
mesg = 
    let setgroup = return (SetGroup 1) in 
    let send = lift (\_ -> SendStr "Yo") (when (buttonA IsPressed)) in 
    setgroup >> send

receivedString :: Signal LED
receivedString = 
    let setgroup = return (SetGroup 1) in 
    let string = lift (\a -> ShowStr a) onReceivedString in 
    setgroup >> string 

main = microBit [
        radio mesg, 
        led receivedString
    ]
