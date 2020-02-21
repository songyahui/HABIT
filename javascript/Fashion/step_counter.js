let step = 0
input.onGesture(Gesture.Shake, function () {
    step += 1
    led.stopAnimation()
})
basic.forever(function() {
    basic.showNumber(step)
})
step = 0