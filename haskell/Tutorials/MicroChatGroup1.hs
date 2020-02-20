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

data Msg = ReceivedString String | None

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        ReceivedString str -> str
 
view :: Model -> MicroBit
view model = 
    microbit [
        buttonA [onPressed None] [setGroup 1, sendString "Yo"]
        ,radio [onReceivedString ReceivedString] [setGroup 1, showstring model]
    ]

main = frameWork inite view update

 





