// shaking is mining...
input.onGesture(Gesture.Shake, () => {
    led.stopAnimation()
    basic.clearScreen()
    basic.pause(200) // display a short pause
    if (Math.randomRange(0, 2) == 0) { // 30% chances to add a transaction
        // we found a coin!!!
        blockchain.addBlock(1);
        basic.showIcon(IconNames.Diamond);
    } else {
        // missed!
        basic.showIcon(IconNames.Asleep);
    }
})

// show my coins
input.onButtonPressed(Button.A, () => {
    led.stopAnimation()
    let coins = blockchain.valuesFrom(blockchain.id()).length;
    basic.showNumber(coins);
    basic.showString("COINS");
})

// show the block chain size
input.onButtonPressed(Button.B, () => {
    led.stopAnimation()
    basic.showNumber(blockchain.length());
    basic.showString("BLOCKS");
})

// instructions on how to play
basic.showString("A=COINS B=CHAIN SHAKE=MINE")