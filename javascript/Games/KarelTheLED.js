class Board {
    public isKarelActive: boolean;
    public karelX: number;
    public karelY: number;

    public ledState: Image;
    private karelDirection: Direction;

    constructor() {
        this.isKarelActive = true;
        this.karelX = 2;
        this.karelY = 2;
        this.karelDirection = Direction.UP;
        this.ledState = images.createImage(`
            . . . . .
            . . . . .
            . . . . .
            . . . . .
            . . . . .
            `);
    }

    pressedA() {
        if (!this.isKarelActive) {
            return;
        }
        this.karelDirection = (this.karelDirection + 1) % 4;
    }

    pressedB() {
        if (!this.isKarelActive) {
            return;
        }
        this.ledState.setPixel(this.karelX, this.karelY, true);
        this.moveKarel()
    }

    shake() {
        if (!this.isKarelActive) {
            return;
        }
        this.moveKarel()
    }

    private moveKarel() {
        if (!this.isKarelActive) {
            return;
        }
        switch (this.karelDirection) {
            case Direction.UP:
                if (this.karelY > 0) {
                    this.karelY -= 1;
                }
                break;
            case Direction.LEFT:
                if (this.karelX > 0) {
                    this.karelX -= 1;
                }
                break;
            case Direction.DOWN:
                if (this.karelY < 4) {
                    this.karelY += 1;
                }
                break;
            case Direction.RIGHT:
                if (this.karelX < 4) {
                    this.karelX += 1;
                }
                break;
        }
    }

    pressedAB() {
        this.isKarelActive = !this.isKarelActive;
    }

    update() {
        this.ledState.showImage(0);
    }
}
const board = new Board();
enum Direction {
    UP = 0,
    LEFT,
    DOWN,
    RIGHT
}
input.onButtonPressed(Button.B, function () {
    board.pressedB();
    board.update();
})
input.onGesture(Gesture.Shake, function () {
    board.shake();
    board.update();
})

input.onButtonPressed(Button.A, function () {
    board.pressedA();
    board.update();
})
input.onButtonPressed(Button.AB, function () {
    board.pressedAB();
    board.update();
})
basic.forever(function () {
    if (board.isKarelActive) {
        led.toggle(board.karelX, board.karelY)
        basic.pause(500)
    }
})