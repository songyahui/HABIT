module MicroBit where

data MicroBit msg = MicroBit msg
data Attribute msg = Attribute msg

--------------------------------------------

data Icon = String

data IconNames = SmallDiamond | Diamond | Yes | No | NoPattern

-- ------------------------------------------
onStart :: [MicroBit msg] -> MicroBit msg
onStart a = (a!!0)

forever :: [MicroBit msg] -> MicroBit msg
forever a = (a!!0)

gesture :: Attribute msg -> [MicroBit msg] -> MicroBit msg
gesture a b =  (b!!0)

pinPressed :: Attribute msg -> [MicroBit msg] -> MicroBit msg
pinPressed a b =  (b!!0)

pinReleased :: Attribute msg -> [MicroBit msg] -> MicroBit msg
pinReleased a b =  (b!!0)

buttonPressed :: Attribute msg -> [MicroBit msg] -> MicroBit msg
buttonPressed a b =  (b!!0)

radio :: Attribute msg -> [MicroBit msg] -> MicroBit msg
radio a b =  (b!!0)

-------------------------------------------

onShake :: msg -> Attribute msg
onShake a = Attribute a

onLogoUp :: msg -> Attribute msg
onLogoUp a = Attribute a

onLogoDOwn :: msg -> Attribute msg
onLogoDOwn a = Attribute a

onScreenUp :: msg -> Attribute msg
onScreenUp a = Attribute a

onScreenDown :: msg -> Attribute msg
onScreenDown a = Attribute a

onTiltLeft :: msg -> Attribute msg
onTiltLeft a = Attribute a

onTiltRight :: msg -> Attribute msg
onTiltRight a = Attribute a


onFreeFall :: msg -> Attribute msg
onFreeFall a = Attribute a

onThreeG :: msg -> Attribute msg
onThreeG a = Attribute a

onSixG :: msg -> Attribute msg
onSixG a = Attribute a

onEightG :: msg -> Attribute msg
onEightG a = Attribute a


onPin0 ::  msg -> Attribute  msg
onPin0 a = Attribute a 

onPin1 ::  msg -> Attribute  msg
onPin1 a = Attribute a 

onPin2 ::  msg -> Attribute  msg
onPin2 a = Attribute a 

onButtonA :: msg -> Attribute  msg
onButtonA a = Attribute a 

onButtonB :: msg -> Attribute  msg
onButtonB a = Attribute a 

onButtonAB :: msg -> Attribute  msg
onButtonAB a = Attribute a 

onReceivedString ::  msg -> Attribute  msg
onReceivedString a = Attribute a 


-------------------------------------------

showstring :: msg -> String -> MicroBit msg
showstring m str =  MicroBit m 

showicon :: msg -> IconNames -> MicroBit msg
showicon m i =  MicroBit m

setGroup :: msg -> Int -> MicroBit msg
setGroup m num =  MicroBit m 

sendString ::msg -> String -> MicroBit msg
sendString m str =  MicroBit m 


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

