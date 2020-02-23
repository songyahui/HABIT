input.onGesture(Gesture.Shake, function () {
    motions += 1
    basic.showNumber(motions)
})


input.onButtonPressed(Button.A, function () {
    motions = 0
    basic.showNumber(motions)
})


let motions = 0
motions = 0

basic.showNumber(motions)
