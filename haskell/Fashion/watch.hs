import MicroBit

type Model = Int

inite :: Model 
inite  = 0 

data Msg = Increase | Reset


update :: Msg -> Model -> Model 
update msg model = 
    case msg of 
        Increase -> model + 1 
        Reset -> 0

view :: Model -> MicroBit
view model = 
    microbit [
        gesture [onShake Increase ] [
            shownumber model 
        ],
        buttonA [onPressed Reset] [
            shownumber model 
        ]
    ]


main = ivu_FrameWork inite view update
