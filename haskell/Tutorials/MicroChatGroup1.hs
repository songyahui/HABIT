import MicroBit
import Prelude hiding (map)

mesg :: Sig String
mesg = map (\_ -> "Yo") (buttonA IsPressed)

receivedString :: Sig String
receivedString = onReceivedString

group :: Sig Int
group = return 1 

radio :: MicroBit
radio = par [
    radio_setGroup group >> radio_sendStr mesg,
    radio_setGroup group >> showStr receivedString
    ]
