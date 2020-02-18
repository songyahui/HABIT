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


type Model = Bool 

inite :: Model
inite = randomBoolean
     
view :: Model -> MicroBit ()
view model = 
    buttonPressed (onButtonA ()) [
            leds () (getIcon SmallDiamond)
            , leds () (getIcon Diamond)
            , leds () (getIcon SmallDiamond)
            , leds () (getIcon Diamond) 
            , if model then leds () (getIcon Yes) else leds () (getIcon No) 
    ]