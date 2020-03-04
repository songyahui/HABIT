module MicroBit where

type MicroBit = IO ()

type Posix = Int

data Cmd msg = Cmd msg | CmdNone

data Sub msg = Sub msg | SubNone

data Group = AnyGroup | Group Int

data Attribute msg = Attribute msg

data Generator a = Generator a

type LED = [String]

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
readSensor fun (Generator a) = CmdNone

radioSendString :: Group -> String -> Cmd msg
radioSendString g str =  CmdNone

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

radioReceivedString :: Group -> (String -> msg) -> Sub msg
radioReceivedString g fun =  Sub (fun "1") 
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

leds:: [Attribute msg] -> [IO ()] -> MicroBit
leds a b = b !! 0

pin0 ::[Attribute msg] -> [IO ()] -> MicroBit
pin0 a b = b !! 0

pin1 ::[Attribute msg] -> [IO ()] -> MicroBit
pin1 a b = b !! 0

pin2 ::[Attribute msg] -> [IO ()] -> MicroBit
pin2 a b = b !! 0

buttonA ::[Attribute msg] -> [IO ()] -> MicroBit
buttonA a b = b !! 0

buttonB ::[Attribute msg] -> [IO ()] -> MicroBit
buttonB a b = b !! 0

buttonAB ::[Attribute msg] -> [IO ()] -> MicroBit
buttonAB a b = b !! 0

gesture ::[Attribute msg] -> [IO ()] -> MicroBit
gesture a b = b !! 0

radio ::[Attribute msg] -> [IO ()] -> MicroBit
radio a b = b !! 0

-----------------------------------
-------- MicroBit Event -----------

onShake :: msg -> Attribute msg
onShake m =  Attribute (m)

onLogoDown :: msg ->  Attribute msg
onLogoDown m = Attribute (m)

onPressed :: msg -> Attribute msg
onPressed m = Attribute (m)

onReleased :: msg -> Attribute msg
onReleased m = Attribute (m)

-------------------------------------------

-----------------------------------
-------- MicroBit IO -----------

showLeds :: LED -> MicroBit
showLeds str =  print (str!! 0)

showString :: String -> MicroBit
showString str =  print str

showNumber :: Int -> MicroBit
showNumber num =  print (show num)

plot :: Int -> Int -> MicroBit
plot n1 n2 = return ()

showIcon :: IconNames -> MicroBit
showIcon icon =  print "a"

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


