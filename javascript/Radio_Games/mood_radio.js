input.onButtonPressed(Button.A, () => {
    radio.sendNumber(0)
    basic.showIcon(IconNames.Happy)
})
input.onButtonPressed(Button.B, () => {
    radio.sendNumber(1)
    basic.showIcon(IconNames.Sad)
})
radio.onReceivedNumber(function (receivedNumber) {
    if (receivedNumber == 0) {
        basic.showIcon(IconNames.Happy)
    }
    if (receivedNumber == 1) {
        basic.showIcon(IconNames.Sad)
    }
})