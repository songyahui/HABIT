{--
basic.forever(function () {
    basic.showString("Hello!")
    basic.showString("Test")
})
--}


import MicroBit

main  = forever
        [
            showstring "Hello!"
            , showstring "Test!"
        ]
