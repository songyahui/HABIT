import MicroBit 

type Model = Int 

inite :: (Model, Cmd Msg) 
inite = (0, CmdNone)

data Msg = Tick Posix | ConsumeLevel Int

update :: Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        Tick time -> (model, readSensor ConsumeLevel lightLevel)
        ConsumeLevel num -> (num, CmdNone)


subscriptions :: Model -> Sub Msg
subscriptions model =
  every 3000 Tick

view :: Model -> MicroBit
view model  =  
    microbit [
        forever [] [
            if model < 16 then 
                clearScreen
            else 
                showLeds "# # . # # # # . # # . # # # . . # . # . . # . # ."
                , showLeds ". . # . . . . # . . # . . . # # . # . # # . # . #"
                
        ]
    ]

main = element inite view update subscriptions
