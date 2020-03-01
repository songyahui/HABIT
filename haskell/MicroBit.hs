module MicroBit where

type MicroBit = IO ()

type Posix = Int

data Cmd msg = Cmd msg | CmdNone

data Sub msg = Sub msg | SubNone

data Generator a = Generator a

sandbox :: model -> (model -> IO ()) -> (msg -> model -> model) -> IO ()
sandbox inite view update = return ()

element :: ( model, Cmd msg ) -> (model -> IO ()) -> (msg -> model -> ( model, Cmd msg )) -> (model -> Sub msg) -> IO ()
element init view update subscriptions = return ()


(@>) :: (model->f) -> f -> ()
f @> d = ()

(<^>) :: model -> [()] -> model
m <^> tu = m

(#) :: model -> (model->f)  -> f
m # f = f m 


--------------
-- Random
-------------

generate :: (a -> msg) -> Generator a -> Cmd msg
generate fun (Generator a) = Cmd (fun a) 


readSensor :: (a -> msg) -> Generator a -> Cmd msg
readSensor fun (Generator a) = Cmd (fun a) 

--------------
-- Radio
-------------

expectString :: (a -> msg) -> a -> msg 
expectString fun a = fun a 


--------------
-----Time
--------------

every :: Int -> (Posix -> msg) -> Sub msg
every n fun =  Sub (fun 1) 
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

gameOver ::  MicroBit
gameOver =  return  ()

continue ::  MicroBit
continue =  return  ()

clearScreen ::  MicroBit
clearScreen =  return  ()

addScore :: Int  -> MicroBit
addScore num =  print (show num)

ifOnEdgeBounce ::  MicroBit
ifOnEdgeBounce =  return ()

stopAnimation::  MicroBit
stopAnimation =  return ()


-----------------------------------
-------- MicroBit Input -----------

lightLevel :: Generator Int
lightLevel = Generator 0 

-------------------------------------

-----------------------------------
-------- MicroBit Game -----------
type Game_LedSprite = [(Int, Int)]

runningTime ::Int
runningTime = 1 

spritemove:: Int -> MicroBit 
spritemove n = return ()

-----------------------------------
-------- MicroBit Math -----------

randomRange ::Int -> Int -> Generator Int 
randomRange n1 n2 = Generator 1

randomBoolean :: Generator Bool
randomBoolean = Generator True

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


