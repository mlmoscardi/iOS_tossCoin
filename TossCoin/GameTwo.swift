import UIKit

class GameTwo: UIViewController {

    // Outlets
    @IBOutlet weak var greenText1: UILabel!
    @IBOutlet weak var greenText2: UILabel!
    @IBOutlet weak var inputFlip: UITextField!
    @IBOutlet weak var inputPlayers: UITextField!
    
    // Variables
    var headsCountTotal = 0
    var playerNumber = 0

    // Arrays
    var headsCountArray = [Int]()
    var playersArray = [String]()
    var winnersArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Preset stroke color and stroke width
        let attrString = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.strokeWidth : -2.0,
        ] as [NSAttributedString.Key : Any]

        // Set font attributes
        greenText1.attributedText = NSAttributedString(string: "Did You Know???", attributes: attrString)
        greenText2.attributedText = NSAttributedString(string: "Let's give it a try!!!", attributes: attrString)
    }
 
    @IBAction func flip2Btn(_ sender: Any) {

        let flip = inputFlip.text!
        let inputFlipInt = Int(flip)
        let players = inputPlayers.text!
        let inputPlayersInt = Int(players)

        var headsCount = 0

        // Check if inputFlipInt is a number and not 0
        if (inputFlipInt != nil && inputFlipInt! != 0 && inputPlayersInt != nil && inputPlayersInt! != 0) {

            // For each player, flip the coin the amount from user input
            for player in 1...inputPlayersInt! {
                for _ in 1...inputFlipInt! {
                    let random = Int.random(in: 0...1)
                    if (random == 0) {
                        headsCount += 1
                    } else {
                        break
                    }
                }
                headsCountArray.append(headsCount)
                playersArray.append("Player \(player) has \(headsCount) heads in a row")
                print(playersArray[player - 1])
                headsCount = 0
            }

            // Check how many players flipped heads equal to user input
            for heads in headsCountArray {
                if (heads == inputFlipInt!) {
                    headsCountTotal += 1
                }
            }
            print("There are \(headsCountTotal) player(s) who flipped \(inputFlipInt!) heads in a row")

            // Find which player flipped heads the amount from the user input
            for player in 1...inputPlayersInt! {
                if (headsCountArray[playerNumber] == inputFlipInt!) {
                    print("Player \(player) flipped \(inputFlipInt!) heads in a row")
                    winnersArray.append("Player \(player) flipped \(inputFlipInt!) heads in a row")
                }
                playerNumber += 1
            }
            playerNumber = 0

        } else { // Alert if inputNumber is not a number or not 0
                let alert = UIAlertController(title: "Error", message: "Please enter a number greater than 0", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
        }

        // Perform segue to GameTwoResults
        performSegue(withIdentifier: "toGameTwoResults", sender: self)
    }

    // Prepare for segue with all the data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameTwoResults" {
            let destinationVC = segue.destination as! GameTwoResults
            destinationVC.playersArray = playersArray
            destinationVC.winnersArray = winnersArray
            destinationVC.headsCountTotal = headsCountTotal
            destinationVC.inputPlayers = inputPlayers.text!
            destinationVC.inputFlip = inputFlip.text!
        }
    }
}
