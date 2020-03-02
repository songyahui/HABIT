# HABIT
Langugae Abstraction for Micro:Bit


https://makecode.microbit.org/projects/reaction-time


```haskell
module MicroBit where

type MicroBit = IO ()

type Posix = Int

data Cmd msg = Cmd msg | CmdNone

data Sub msg = Sub msg | SubNone

data Generator a = Generator a

sandbox :: model -> (model -> IO ()) -> (msg -> model -> model) -> IO ()

element :: ( model, Cmd msg ) -> (model -> IO ()) -> (msg -> model -> ( model, Cmd msg )) -> (model -> Sub msg) -> IO ()

(@>) :: (model->f) -> f -> ()

(<^>) :: model -> [()] -> model

(#) :: model -> (model->f)  -> f

--------------
-- Random
-------------

generate :: (a -> msg) -> Generator a -> Cmd msg

readSensor :: (a -> msg) -> Generator a -> Cmd msg

--------------
-- Radio
-------------

expectString :: (a -> msg) -> a -> msg 

--------------
-----Time
--------------

every :: Int -> (Posix -> msg) -> Sub msg

--------------------------------------------

data Icon = String

data IconNames = SmallDiamond | Diamond | Yes | No | NoPattern

data Dimension = X | Y | Z | Strangth

type Sprite = (Int, Int)

type Score = Int

--------------------------------------------

microbit :: [MicroBit] -> MicroBit

onStart :: [MicroBit] -> MicroBit

forever ::[ msg] -> [MicroBit] -> MicroBit

-----------------------------------
-------- MicroBit Input Device ----------

leds:: [ msg] -> [MicroBit] -> MicroBit

pin0 ::[ msg] -> [MicroBit] -> MicroBit

pin1 ::[ msg] -> [MicroBit] -> MicroBit

pin2 ::[ msg] -> [MicroBit] -> MicroBit

buttonA ::[ msg] -> [MicroBit] -> MicroBit

buttonB ::[ msg] -> [MicroBit] -> MicroBit

buttonAB ::[ msg] -> [MicroBit] -> MicroBit

gesture ::[ msg] -> [MicroBit] -> MicroBit

radio ::[ msg] -> [MicroBit] -> MicroBit

-----------------------------------
-------- MicroBit Event -----------

onReceivedString :: (String -> msg) ->  msg

onShake :: msg ->  msg

onLogoDown :: msg ->  msg

onPressed :: msg ->  msg

onReleased :: msg ->  msg

-------------------------------------------

-----------------------------------
-------- MicroBit IO -----------

showLeds :: String -> MicroBit

showstring :: String -> MicroBit

shownumber :: Int -> MicroBit

plot :: Int -> Int -> MicroBit

showicon :: IconNames -> MicroBit

setGroup :: Int -> MicroBit

sendString :: String -> MicroBit

gameOver ::  MicroBit

continue ::  MicroBit

clearScreen ::  MicroBit

addScore :: Int  -> MicroBit

ifOnEdgeBounce ::  MicroBit

stopAnimation::  MicroBit

-----------------------------------
-------- MicroBit Input -----------

lightLevel :: Generator Int

-------------------------------------

-----------------------------------
-------- MicroBit Game -----------
type Game_LedSprite = [(Int, Int)]

runningTime ::Int

spritemove:: Int -> MicroBit 

-----------------------------------
-------- MicroBit Math -----------

randomRange ::Int -> Int -> Generator Int 

randomBoolean :: Generator Bool

fromInt :: Int -> String 

math_abs :: Float -> Int 

math_max :: Int -> Int -> Int

magneticForce :: Dimension -> Float

emptyLeds :: String

```
