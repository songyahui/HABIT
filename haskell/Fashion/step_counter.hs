import MicroBit 

type Model = Int

inite :: Model
inite = 0

data Msg = IncreaseStep

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        IncreaseStep -> model + 1

view :: Model -> MicroBit
view model  = 
    microbit [
        gesture [onShake IncreaseStep] [
            stopAnimation
        ],
        forever [] [
            shownumber model 
        ]
    ]

main = sandbox inite view update
