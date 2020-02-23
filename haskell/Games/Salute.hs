import MicroBit

type Model = (Int, Int)

inite:: Model
inite = (0,0)

data Msg = Player1Gain | Player2Gain | Reset

update :: Msg -> Model -> Model 
update msg (player1Score, player2Score) = 
    case msg of
        Player1Gain -> (player1Score + 1, player2Score) 
        Player2Gain -> (player1Score, player2Score + 1) 
        Reset -> (0,0)

view :: Model -> MicroBit
view (player1Score, player2Score) = 
     microbit[
         buttonA [onPressed Player1Gain] [], 
         buttonB [onPressed Player2Gain] [], 
         buttonAB [onPressed] [
             if player1Score == player2Score then showstring "TIE"
             else if player1Score > player2Score then showstring "Player 1"
             else showstring "Player 2", 
                  shownumber(max player1Score player2Score)
         ], 
         gesture [onLogoDown Reset] [
             showstring "Reset", 
             pause 1000, 
             clearScreen
         ]
     ]

main = ivu_FrameWork inite view update
