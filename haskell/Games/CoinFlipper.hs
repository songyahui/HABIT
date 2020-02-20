{--
input.onButtonPressed(Button.A, function () {
    basic.showIcon(IconNames.SmallDiamond)
    basic.showIcon(IconNames.Diamond)
    basic.showIcon(IconNames.SmallDiamond)
    basic.showIcon(IconNames.Diamond)
    if (Math.randomBoolean()) {
        basic.showIcon(IconNames.Yes)
    } else {
        basic.showIcon(IconNames.No)
    }
})
basic.forever(function () {
	
})
--}

import MicroBit


data Model = Model {b::Bool} 

inite :: Model
inite = Model True

data Msg = GetRandomBool

update :: Msg -> Model -> Model
update msg model = 
    case msg of 
        GetRandomBool -> model <^> [b @> randomBoolean]
     
view :: Model -> MicroBit
view model = 
    buttonA [onPressed GetRandomBool] [
            showicon SmallDiamond, 
            showicon Diamond, 
            showicon SmallDiamond, 
            showicon Diamond, 
            if model # b then showicon Yes else showicon No
    ]

main = ivu_FrameWork inite view update