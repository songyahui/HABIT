module MicroBit where

type MicroBit = IO ()

data Signal msg = Signal msg


frameWork :: model -> (model -> IO ()) -> (msg -> model -> model) -> IO ()
frameWork inite view update = return ()

--------------------------------------------

data Icon = String

data IconNames = SmallDiamond | Diamond | Yes | No | NoPattern

data Dimension = X | Y | Z | Strangth

type Sprite = (Int, Int)

type Score = Int

--------------------------------------------

microbit :: [MicroBit] -> MicroBit
microbit li = (li !! 1)

onStart :: [MicroBit] -> MicroBit
onStart a = (a!!0)

forever :: [MicroBit] -> MicroBit
forever a = (a!!0)

-----------------------------------
-------- MicroBit Input Device ----------

leds:: [Signal msg] -> [MicroBit] -> MicroBit
leds a b = b !! 0

pin0 ::[Signal msg] -> [MicroBit] -> MicroBit
pin0 a b = b !! 0

pin1 ::[Signal msg] -> [MicroBit] -> MicroBit
pin1 a b = b !! 0

pin2 ::[Signal msg] -> [MicroBit] -> MicroBit
pin2 a b = b !! 0

buttonA ::[Signal msg] -> [MicroBit] -> MicroBit
buttonA a b = b !! 0

buttonB ::[Signal msg] -> [MicroBit] -> MicroBit
buttonB a b = b !! 0

buttonAB ::[Signal msg] -> [MicroBit] -> MicroBit
buttonAB a b = b !! 0

gesture ::[Signal msg] -> [MicroBit] -> MicroBit
gesture a b = b !! 0

radio ::[Signal msg] -> [MicroBit] -> MicroBit
radio a b = b !! 0

-----------------------------------
-------- MicroBit Event -----------

onReceivedString :: (String -> msg) -> Signal msg
onReceivedString fun = Signal (fun "a")

onShake :: msg -> Signal msg
onShake m = Signal (m)

onPressed :: msg -> Signal msg
onPressed m = Signal (m)

onReleased :: msg -> Signal msg
onReleased m = Signal (m)

-------------------------------------------

-----------------------------------
-------- MicroBit IO -----------

showLeds :: String -> MicroBit
showLeds str =  print str

showstring :: String -> MicroBit
showstring str =  print str

shownumber :: Int -> MicroBit
shownumber num =  print (show num)

showicon :: IconNames -> MicroBit
showicon icon =  print "a"

setGroup :: Int -> MicroBit
setGroup num =  return  ()

sendString :: String -> MicroBit
sendString str =  print "a"

pause :: Int -> MicroBit
pause num =  print (show num)

gameOver ::  MicroBit
gameOver =  return  ()

addScore :: Int  -> MicroBit
addScore num =  print (show num)

ifOnEdgeBounce ::  MicroBit
ifOnEdgeBounce =  return ()

-------------------------------------

-----------------------------------
-------- MicroBit Game -----------


spritemove:: Sprite -> Int -> Sprite 
spritemove s n = s

-----------------------------------
-------- MicroBit Math -----------

randomRange ::Int -> Int -> Int 
randomRange n1 n2 = 1

randomBoolean :: Bool
randomBoolean = True

fromInt :: Int -> String 
fromInt n = show n

math_abs :: Float -> Int 
math_abs f =  0

magneticForce :: Dimension -> Float
magneticForce d =  0.0


