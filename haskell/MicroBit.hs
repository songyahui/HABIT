module MicroBit where

--------------------------------------------------------------
-----Abstraction of Signal------------------------------------
-----Signal is a functor, Applicative, and Monad--------------
--------------------------------------------------------------
data Signal a = Signal a

instance Functor Signal where
    fmap fun (Signal a) = Signal $ fun a

instance Applicative Signal where
    pure a = Signal a
    (<*>) (Signal fun) (Signal a) = (Signal $ fun a)

instance Monad Signal where
    return a = Signal a  
    (>>=) (Signal a) fun = (fun a) 
    (>>) (Signal a) (Signal b) = (Signal b)

--------------------------------------------------------------
-----Abstraction of Temporal Operators------------------------
--------------------------------------------------------------

when :: Signal Bool -> Signal Bool
when a = a

pre :: Signal a -> Signal a
pre a = a

-- followed by
(@>) :: a -> Signal a -> Signal a
init @> rest = rest

current :: Signal a -> Signal a
current a = a

--------------------------------------------------------------
-----Abstraction of Combinators-------------------------------
--------------------------------------------------------------

fold :: (a -> b -> b) -> b -> Signal a -> Signal b
fold fun b (Signal a) = Signal (fun a b)

lift :: (a -> b ) -> Signal a  -> Signal b
lift fun (Signal a) =  Signal (fun a )

lift_2 :: (a -> b -> c) -> Signal a -> Signal b -> Signal c
lift_2 fun (Signal a) (Signal b) =  Signal (fun a b)

lift_3 :: (a -> b -> c ->d) -> Signal a -> Signal b -> Signal c -> Signal d
lift_3 fun (Signal a) (Signal b) (Signal c) =  Signal (fun a b c)

lift_4 :: (a -> b -> c ->d -> e) -> Signal a -> Signal b -> Signal c -> Signal d -> Signal e
lift_4 fun (Signal a) (Signal b) (Signal c) (Signal d) = Signal (fun a b c d)

lift_5 :: (a -> b -> c ->d -> e->f) -> Signal a -> Signal b -> Signal c -> Signal d -> Signal e -> Signal f
lift_5 fun (Signal a) (Signal b) (Signal c) (Signal d) (Signal e) = Signal (fun a b c d e )

--------------------------------------------------------------
-------- Abstraction of a MicroBit kit -----------------------
--------------------------------------------------------------

type MicroBit = IO ()

data LED = ShowNum Int | ShowStr String | ShowLED [String] 
data RADIO = SendStr String | SetGroup Int

led :: Signal LED -> MicroBit
led m = return () 

radio :: Signal RADIO -> MicroBit
radio m = return ()

plot :: Int -> Int -> Signal Bool -> MicroBit
plot x y s = return ()

sendString :: String -> IO ()
sendString str = return ()


microBit :: [MicroBit] -> MicroBit
microBit a = a!!0

onStart :: [MicroBit] -> MicroBit
onStart a = a!!0

--------------------------------------------------------------
--------------- Gesture Listeners ----------------------------
--------------------------------------------------------------

onShake :: Signal Bool
onShake = Signal True

onLogoUp :: Signal Bool
onLogoUp = Signal True

onLogoDown :: Signal Bool
onLogoDown = Signal True

onScreenUp :: Signal Bool
onScreenUp = Signal True

onScreenDown :: Signal Bool
onScreenDown = Signal True

tiltLeft :: Signal Bool
tiltLeft = Signal True

tiltRight :: Signal Bool
tiltRight = Signal True

freeFall :: Signal Bool
freeFall = Signal True

threeG :: Signal Bool
threeG = Signal True

sixG :: Signal Bool
sixG = Signal True

eightG :: Signal Bool
eightG = Signal True


onReceivedString :: Signal String
onReceivedString = Signal "True"

--------------------------------------------------------------
--------------- Press Listeners ------------------------------
--------------------------------------------------------------

data Opration = IsPressed | IsReleased

pin0 :: Opration -> Signal Bool
pin0 op = Signal True

pin1 :: Opration -> Signal Bool
pin1 op = Signal True

pin2 :: Opration -> Signal Bool
pin2 op = Signal True

buttonA :: Opration -> Signal Bool
buttonA op = Signal True

buttonB :: Opration -> Signal Bool
buttonB op = Signal True

buttonAB :: Opration -> Signal Bool
buttonAB op = Signal True

--------------------------------------------------------------
----- Preliminaries for randomness ---------------------------
--------------------------------------------------------------

randomRange :: Int -> Int -> Int
randomRange a b = 0 





generateRandomBool :: Bool
generateRandomBool = True



everySec :: Signal Int
everySec = Signal 1

foldP :: ( a -> acc -> acc) -> acc -> Signal a -> Signal acc
foldP fun init li = Signal init