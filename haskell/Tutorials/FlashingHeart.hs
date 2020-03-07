import MicroBit

pattern :: Sig Pattern
pattern = return
    [   ". # . # .",
        "# # # # #",
        "# # # # #",
        ". # # # .",
        ". . # . ."]

led:: MicroBit
led = showLED pattern
    