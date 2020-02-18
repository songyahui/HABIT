{--
input.onButtonPressed(Button.A, function () {
    radio.sendString("Yo")
})
radio.onReceivedString(function (receivedString) {
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
        buttonPressed (onButtonA None) [(sendString None ("Yo"))]
        ,radio (onReceivedString (ReceivedString model)) [
            leds None model
        ]
    ]


