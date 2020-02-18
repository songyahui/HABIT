import MicroBit



{--
let force = 0;
let isSwitched = false;
basic.forever(() => {
    force = Math.abs(input.magneticForce(Dimension.Strength));
    isSwitched = force > 100
})

input.onButtonPressed(Button.A, () => {
    if (isSwitched) {
        basic.showString("B")
    } else {
        basic.showString("A")
    }
})
input.onButtonPressed(Button.B, () => {
    if (isSwitched) {
        basic.showString("A")
    } else {
        basic.showString("B")
    }
})
--}