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

data Msg = ReceivedString String 

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        ReceivedString str -> str
     
view :: Model -> MicroBit Msg
view model = 
    microbit [
        buttonAPressed [] [(showstring [] ("Yo"))]
        ,radioonReceivedString [ ReceivedString model] [
            showstring [] model
        ]
    ]


