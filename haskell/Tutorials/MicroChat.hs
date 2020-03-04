import MicroBit

mesg :: Signal RADIO
mesg = lift (\_ -> SendStr "Yo") (when (buttonA IsPressed))

receivedString :: Signal LED
receivedString = lift (\a -> ShowStr a) onReceivedString

main = microBit [
        radio mesg, 
        led receivedString
    ]
