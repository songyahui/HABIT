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

data Model = Model {message :: String}

inite :: Model
inite = Model ""

data Msg = ReceivedString String | None

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        ReceivedString str -> model <^> [message@> str]
     
view :: Model -> MicroBit
view model = 
    microbit [
        buttonA [onPressed None] [sendString "Yo"],
        radio [onReceivedString ReceivedString] [showstring (model # message)]
    ]

main = ivu_FrameWork inite view update
