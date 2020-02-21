{--

input.onButtonPressed(Button.A, () => {
    radio.sendNumber(0)
    basic.showIcon(IconNames.No)
})
input.onButtonPressed(Button.B, () => {
    radio.sendNumber(255)
    basic.showIcon(IconNames.Yes)
})
radio.setGroup(4)
radio.setTransmitSerialNumber(true)
basic.showIcon(IconNames.Ghost)

--}