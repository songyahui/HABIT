{--

let potato = 0
radio.onReceivedNumber(function (receivedNumber) {
    potato = receivedNumber
})
input.onGesture(Gesture.Shake, () => {
    if (potato > 0) {
        radio.sendNumber(potato)
        potato = -1
    }
})
input.onButtonPressed(Button.AB, () => {
    potato = Math.randomRange(10, 20)
})
radio.setGroup(1)
potato = -1
basic.forever(() => {
    if (potato == 0) {
        basic.showIcon(IconNames.Skull)
    }
    if (potato < 0) {
        basic.clearScreen()
    }
    if (potato > 0) {
        basic.showIcon(IconNames.Chessboard)
        potato += -1
    }
})

--}