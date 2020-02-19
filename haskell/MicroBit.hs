module MicroBit where

data MicroBit msg = MicroBit msg

--------------------------------------------

data Icon = String

data IconNames = SmallDiamond | Diamond | Yes | No | NoPattern

--------------------------------------------

onStart :: [msg] -> [MicroBit msg] -> MicroBit msg
onStart att a = (a!!0)

forever :: [msg] -> [MicroBit msg] -> MicroBit msg
forever att a = (a!!0)

gestureonShake :: [ msg] -> [MicroBit msg] -> MicroBit msg
gestureonShake a b =  (b!!0)

pin0Pressed :: [ msg] -> [MicroBit msg] -> MicroBit msg
pin0Pressed a b =  (b!!0)

pin1Pressed :: [ msg] -> [MicroBit msg] -> MicroBit msg
pin1Pressed a b =  (b!!0)

pin2Pressed :: [ msg] -> [MicroBit msg] -> MicroBit msg
pin2Pressed a b =  (b!!0)

pin0Released :: [ msg] -> [MicroBit msg] -> MicroBit msg
pin0Released a b =  (b!!0)

pin1Released :: [ msg] -> [MicroBit msg] -> MicroBit msg
pin1Released a b =  (b!!0)

pin2Released :: [ msg] -> [MicroBit msg] -> MicroBit msg
pin2Released a b =  (b!!0)

buttonAPressed :: [ msg] -> [MicroBit msg] -> MicroBit msg
buttonAPressed a b =  (b!!0)

buttonBPressed :: [ msg] -> [MicroBit msg] -> MicroBit msg
buttonBPressed a b =  (b!!0)


buttonABPressed :: [ msg] -> [MicroBit msg] -> MicroBit msg
buttonABPressed a b =  (b!!0)

radioonReceivedString :: [ msg] -> [MicroBit msg] -> MicroBit msg
radioonReceivedString a b =  (b!!0)

-------------------------------------------

-------------------------------------------

showstring :: [msg] -> String -> MicroBit msg
showstring m str =  MicroBit (m !! 0)

showleds :: [msg] -> String -> MicroBit msg
showleds m str =  MicroBit (m !! 0)

shownumber :: [msg] -> Int -> MicroBit msg
shownumber m num =  MicroBit (m !! 0)

showicon :: [msg] -> IconNames -> MicroBit msg
showicon m i =  MicroBit (m !! 0)

setGroup :: [msg] -> Int -> MicroBit msg
setGroup m num =  MicroBit (m !! 0)

sendString ::[msg] -> String -> MicroBit msg
sendString m str =  MicroBit (m !! 0)

pause :: [msg] -> Int -> MicroBit msg
pause m num =  MicroBit (m !! 0)

-------------------------------------

microbit :: [MicroBit msg] -> MicroBit msg
microbit li = (li !! 1)

randomRange ::Int -> Int -> Int 
randomRange n1 n2 = 1

randomBoolean :: Bool
randomBoolean = True

fromInt :: Int -> String 
fromInt n = show n

main = print 1
