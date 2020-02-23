import MicroBit 

main = 
    microbit [
        forever [] [
            if lightLevel > 16 then 
                showLeds "# # . # # # # . # # . # # # . . # . # . . # . # ."
                >> showLeds ". . # . . . . # . . # . . . # # . # . # # . # . #"
            else 
                clearScreen,
                pause 3000

        ]
    ]
