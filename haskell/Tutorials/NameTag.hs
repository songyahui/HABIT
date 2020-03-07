import MicroBit

hello :: MicroBit
hello = showStr $ return "Hello!"

icon :: MicroBit
icon = showIcon $ return SmallDiamond

led :: MicroBit
led = hello >> icon
