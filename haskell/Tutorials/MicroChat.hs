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

data Msg = ReceivedString String | None

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        ReceivedString str -> str
     
view :: Model -> MicroBit
view model = 
    microbit [
        buttonA [onPressed None] [sendString "Yo"]
        ,radio [onReceivedString ReceivedString] [showstring model]
    ]

main = ivu_FrameWork inite view update
