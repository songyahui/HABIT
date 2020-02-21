let moving = false
let REDLIGHT = 0
let state = 0
let GREENLIGHT = 0
radio.onReceivedNumber(function (receivedNumber) {
    state = receivedNumber
})
GREENLIGHT = 1
REDLIGHT = 2
radio.setGroup(1)
basic.forever(function () {
    if (state == GREENLIGHT) {
        basic.showIcon(IconNames.Yes)
    } else if (state == REDLIGHT) {
        basic.showIcon(IconNames.No)
    }
    if (state == REDLIGHT) {
        moving = Math.abs(input.acceleration(Dimension.Strength) - 1000) > 100
        if (state == REDLIGHT && moving) {
            game.gameOver()
        }
    }
})