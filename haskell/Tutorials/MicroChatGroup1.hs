import MicroBit

data Model = Model {message :: String}

inite :: Model
inite = Model ""

data Msg = ReceivedString String

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        ReceivedString str -> model <^> [message@> str]
 
view :: Model -> MicroBit
view model = 
    microbit [
        buttonA [] [
            setGroup 1, 
            sendString "Yo"
            ],
        radio [onReceivedString ReceivedString] [
            setGroup 1, 
            showstring (model # message)
            ]
    ]

main = sandbox inite view update

 





