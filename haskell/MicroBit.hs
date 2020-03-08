module MicroBit where

--------------------------------------------------------------
-----Abstraction of Signal------------------------------------
-----Signal is a functor, Applicative, and Monad--------------
--------------------------------------------------------------

data Sig a = Sig a

instance Functor Sig where
    fmap fun (Sig a) = Sig $ fun a

instance Applicative Sig where
    pure a = Sig a
    (<*>) (Sig fun) (Sig a) = (Sig $ fun a)

instance Monad Sig where
    return a = Sig a  
    (>>=) (Sig a) fun = (fun a) 
    (>>) (Sig a) (Sig b) = (Sig b)

----------------------------------------------------
-- I do not know if we need to assume a same clock--
----------------------------------------------------

class (Monad signal) => Signal signal  where
-----------------------------
-----Temporal Operators------
-----------------------------
    (@>)  :: a -> signal a -> signal a -- followed by
    pre   :: signal a -> signal a
    when  ::  signal Bool -> signal a ->signal a
    -- current :: signal a -> signal a 
-----------------------------
------  Combinators   -------
-----------------------------
    fold  :: (a -> b -> b) -> b -> signal a -> signal b
    filter:: (a -> Bool) -> signal a -> signal a -- similar to when
    map :: (a -> b ) -> signal a  -> signal b
    map_2 :: (a -> b -> c) -> signal a -> signal b -> signal c
    map_3 :: (a -> b -> c ->d) -> signal a -> signal b -> signal c -> signal d
    map_4 :: (a -> b -> c ->d -> e) -> signal a -> signal b -> signal c -> signal d -> signal e
    map_5 :: (a -> b -> c ->d -> e->f) -> signal a -> signal b -> signal c -> signal d -> signal e -> signal f

--------------------------------------------------------------
--------------- Assertion ------------------------------------
--------------------------------------------------------------
    (.=) :: Eq a => signal a -> a -> Bool
    (.<) :: Eq a => signal a -> a -> Bool
    (.>) :: Eq a => signal a -> a -> Bool


instance Signal Sig where
    (@>) init rest = rest
    pre a = a
    when b a  =  a
    -- current a = a
    fold fun b (Sig a) = Sig (fun a b)
    filter fun a = a
    map fun (Sig a) =  Sig (fun a )
    map_2 fun (Sig a) (Sig b) =  Sig (fun a b)
    map_3 fun (Sig a) (Sig b) (Sig c) =  Sig (fun a b c)
    map_4 fun (Sig a) (Sig b) (Sig c) (Sig d) = Sig (fun a b c d)
    map_5 fun (Sig a) (Sig b) (Sig c) (Sig d) (Sig e) = Sig (fun a b c d e )

    (.=) a1 a2 =  True
    (.>) a1 a2 =  True
    (.<) a1 a2 =  True
    

--------------------------------------------------------------
-------- Abstractions of a MicroBit Devices ------------------
--------------------------------------------------------------

type MicroBit = IO ()

par  :: [MicroBit] -> MicroBit
par a = a!! 0

data ICON = SmallDiamond | Diamond | Yes | No

type Pattern = [String]

plot :: Sig (Int, Int) -> Sig Bool -> MicroBit
plot b s = return ()

showNum :: Sig Int -> MicroBit
showNum n = return ()

showStr :: Sig String -> MicroBit
showStr str = return ()

showLED :: Sig Pattern -> MicroBit
showLED p = return ()

showIcon :: Sig ICON -> MicroBit
showIcon i = return ()

clear :: MicroBit
clear = return ()

pause :: Int -> MicroBit
pause num = return ()

radio_sendStr :: Sig String -> MicroBit
radio_sendStr str = return ()

radio_setGroup :: Sig Int -> MicroBit
radio_setGroup num = return ()

------------------------------------------------------------
--------------- Gesture Signals ----------------------------
------------------------------------------------------------
shake :: Sig Bool
shake = Sig True

logoUp :: Sig Bool
logoUp = Sig True

logoDown :: Sig Bool
logoDown = Sig True

screenUp :: Sig Bool
screenUp = Sig True

screenDown :: Sig Bool
screenDown = Sig True

tiltLeft :: Sig Bool
tiltLeft = Sig True

tiltRight :: Sig Bool
tiltRight = Sig True

freeFall :: Sig Bool
freeFall = Sig True

threeG :: Sig Bool
threeG = Sig True

sixG :: Sig Bool
sixG = Sig True

eightG :: Sig Bool
eightG = Sig True

--------------------------------------------------------------
--------------- Button/Pin Listeners -------------------------
--------------------------------------------------------------

data Opration = IsPressed | IsReleased

pin0 :: Opration -> Sig Bool
pin0 op = Sig True

pin1 :: Opration -> Sig Bool
pin1 op = Sig True

pin2 :: Opration -> Sig Bool
pin2 op = Sig True

buttonA :: Opration -> Sig Bool
buttonA op = Sig True

buttonB :: Opration -> Sig Bool
buttonB op = Sig True

buttonAB :: Opration -> Sig Bool
buttonAB op = Sig True

--------------------------------------------------------------
--------------- RADIO receive Listeners ----------------------
--------------------------------------------------------------

onReceivedString :: Sig String
onReceivedString = Sig "True"

--------------------------------------------------------------
--------------- sensor ----------------------
--------------------------------------------------------------

lightLevel :: Sig Int
lightLevel = Sig 0

data Dimension = Strength | X | Y | Z

magneticForce :: Dimension -> Sig Int
magneticForce a = Sig 0

_abs :: Int -> Int
_abs a = a

--------------------------------------------------------------
--------------- Game ----------------------
--------------------------------------------------------------
type Sprite =  (Int, Int)

type LedSprite = [Sprite]

showLedSprite :: Sig LedSprite -> MicroBit
showLedSprite li = return ()

--------------------------------------------------------------
----- Preliminaries for randomness ---------------------------
--------------------------------------------------------------

randomRange :: Int -> Int -> Int
randomRange a b = 0 

randomBoolean :: Bool
randomBoolean = True




everySec :: Sig Bool
everySec = Sig True

millisec :: Int -> Sig Bool
millisec t = Sig True

main = print 0

assert :: a -> b -> b
assert a b = b
