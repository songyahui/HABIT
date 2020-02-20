module MicroBit where

type MicroBit = IO ()


ivu_FrameWork :: model -> (model -> IO ()) -> (msg -> model -> model) -> IO ()
ivu_FrameWork inite view update = return ()

iv_FrameWork :: model -> (model -> IO ()) ->  IO ()
iv_FrameWork inite view = return ()

(@>) :: (model->f) -> f -> ()
f @> d = ()

(<^>) :: model -> [()] -> model
m <^> tu = m

(#) :: model -> (model->f)  -> f
m # f = f m 


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

forever ::[ msg] -> [MicroBit] -> MicroBit
forever s a = (a!!0)

-----------------------------------
-------- MicroBit Input Device ----------

leds:: [ msg] -> [MicroBit] -> MicroBit
leds a b = b !! 0

pin0 ::[ msg] -> [MicroBit] -> MicroBit
pin0 a b = b !! 0

pin1 ::[ msg] -> [MicroBit] -> MicroBit
pin1 a b = b !! 0

pin2 ::[ msg] -> [MicroBit] -> MicroBit
pin2 a b = b !! 0

buttonA ::[ msg] -> [MicroBit] -> MicroBit
buttonA a b = b !! 0

buttonB ::[ msg] -> [MicroBit] -> MicroBit
buttonB a b = b !! 0

buttonAB ::[ msg] -> [MicroBit] -> MicroBit
buttonAB a b = b !! 0

gesture ::[ msg] -> [MicroBit] -> MicroBit
gesture a b = b !! 0

radio ::[ msg] -> [MicroBit] -> MicroBit
radio a b = b !! 0

-----------------------------------
-------- MicroBit Event -----------

onReceivedString :: (String -> msg) ->  msg
onReceivedString fun =  (fun "a")

onShake :: msg ->  msg
onShake m =  (m)

onLogoDown :: msg ->  msg
onLogoDown m =  (m)

onPressed :: msg ->  msg
onPressed m =  (m)

onReleased :: msg ->  msg
onReleased m =  (m)

-------------------------------------------

-----------------------------------
-------- MicroBit IO -----------

showLeds :: String -> MicroBit
showLeds str =  print str

showstring :: String -> MicroBit
showstring str =  print str

shownumber :: Int -> MicroBit
shownumber num =  print (show num)

plot :: Int -> Int -> MicroBit
plot n1 n2 = return ()

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

clearScreen ::  MicroBit
clearScreen =  return  ()

addScore :: Int  -> MicroBit
addScore num =  print (show num)

ifOnEdgeBounce ::  MicroBit
ifOnEdgeBounce =  return ()

stopAnimation::  MicroBit
stopAnimation =  return ()

-------------------------------------

-----------------------------------
-------- MicroBit Game -----------
runningTime ::Int
runningTime = 1 

spritemove:: Int -> MicroBit 
spritemove n = return ()

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

math_max :: Int -> Int -> Int
math_max n1 n2 = n1

magneticForce :: Dimension -> Float
magneticForce d =  0.0

emptyLeds :: String
emptyLeds = ". . . . . . . . . . . . . . . . . . . . . . . . . ."


