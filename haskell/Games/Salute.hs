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

{--
let player1Score = 0
let player2Score = 0
input.onButtonPressed(Button.A, () => {
    player1Score += 1
})
input.onButtonPressed(Button.B, () => {
    player2Score += 1
})
input.onButtonPressed(Button.AB, () => {
    if (player1Score == player2Score) {
        basic.showString("TIE")
    } else if (player1Score > player2Score) {
        basic.showString("Player 1")
    } else {
        basic.showString("Player 2")
    }
    basic.showNumber(Math.max(player1Score, player2Score))
})
input.onGesture(Gesture.LogoDown, function () {
    player2Score = 0
    player1Score = 0
    basic.showString("Reset")
    basic.pause(1000)
    basic.clearScreen()
})

--}