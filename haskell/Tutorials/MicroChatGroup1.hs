{--
input.onButtonPressed(Button.A, function () {
    radio.setGroup(1)
    radio.sendString("Yo")
})
radio.onReceivedString(function (receivedString) {
    radio.setGroup(1)
    basic.showString(receivedString)
})
basic.forever(function () {
	
})
--}
import MicroBit

type Model = String

inite :: Model
inite = ""

data Msg = None | ReceivedString String 

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        None -> model 
        ReceivedString str -> str
     
view :: Model -> MicroBit Msg
view model = 
    microbit [
        buttonPressed (onButtonA None) [
            setGroup None 1
            , (sendString None ("Yo"))
            ]
        ,radio (onReceivedString (ReceivedString model)) [
            setGroup None 1
            , leds None model
        ]
    ]



