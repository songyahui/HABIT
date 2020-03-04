import MicroBit

type Model = String

inite :: (Model, Cmd Msg)
inite = ("", CmdNone)

data Msg = ReceivedMsg String | Send

update :: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        Send -> (
            model, 
            radioSendString AnyGroup "Yo")
        ReceivedMsg str -> 
            (str, CmdNone)

subscriptions:: Model -> Sub Msg
subscriptions model = 
    radioReceivedString AnyGroup ReceivedMsg
     
view :: Model -> MicroBit
view model = 
    microbit [
        buttonA [onPressed Send] [],
        MicroBit.showString model
    ]

main = element inite view update subscriptions
