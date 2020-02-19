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

data Msg = ReceivedString String 

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        ReceivedString str -> str
     
view :: Model -> MicroBit Msg
view model = 
    microbit [
        buttonAPressed [] [
            setGroup [] 1
            , (showstring [] ("Yo"))
            ]
        ,radioonReceivedString [ReceivedString model] [
            setGroup [] 1
            , showstring [] model
        ]
    ]



