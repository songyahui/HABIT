let dice = 0


input.onGesture(Gesture.Shake, function () {
    dice = Math.randomRange(1, 6)
    basic.showNumber(dice)
    radio.sendNumber(dice)
})


radio.onReceivedNumber(function (receivedNumber) {
    if (receivedNumber >= dice) {
        basic.showIcon(IconNames.Sad)
    }
})