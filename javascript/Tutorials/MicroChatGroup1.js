input.onButtonPressed(Button.A, function () {
    radio.setGroup(1)
    radio.sendString("Yo")
})


radio.onReceivedString(function (receivedString) {
    radio.setGroup(1)
    basic.showString(receivedString)
})


basic.forever(function () {
	
})
