import MicroBit
import Prelude hiding (map)

mesg :: Sig String
mesg = map (\_ -> "Yo") (buttonA IsPressed)

receivedString :: Sig String
receivedString = onReceivedString

radio :: MicroBit
radio = par [
    radio_sendStr mesg,
    showStr receivedString
    ]