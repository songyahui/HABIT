import MicroBit

main  = 
    microbit [
        buttonAB [onPressed ()] [
            showLeds ". # . # . # # # # # # # # # # . # # # . . . # . ."
        ]
    ]