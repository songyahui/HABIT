import MicroBit

main  = 
    microbit [
        buttonA [onPressed ()] [
            showLeds ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
    ]
