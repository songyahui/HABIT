{--
basic.forever(function () {
    basic.showString("Hello!")
    basic.showString("Test")
})
--}


import MicroBit

type Model = Icon


view :: MicroBit ()
view = 
    forever 
        [
            showstring () "Hello!"
            , showstring () "Test!"
        ]
