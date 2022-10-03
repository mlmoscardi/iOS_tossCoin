import UIKit

class GameOne: UIViewController {

    // Outlets
    @IBOutlet weak var tryLuckText: UILabel!
    @IBOutlet weak var goalText: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var headsCounter: UILabel!
    @IBOutlet weak var triesCounter: UILabel!
    @IBOutlet weak var result: UILabel!

    // Variables
    var headCount = 0
    var tryCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Preset stroke color and stroke width
        let attrString = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.strokeWidth : -2.0,
        ] as [NSAttributedString.Key : Any]

        // Set font attributes
        tryLuckText.attributedText = NSAttributedString(string: "Try Your Luck!!!", attributes: attrString)
        goalText.attributedText = NSAttributedString(string: "THE ULTIMATE GOAL", attributes: attrString)
        
        // Resize the DAMN text
        tryLuckText.sizeToFit()
    }
    
    @IBAction func flipBtn(_ sender: Any) {
       
        let inputNumber = inputNum.text!
        let inputInt = Int(inputNumber)
        
        // Create random number for the coin side
        let randNum = Int.random(in: 0...1)

        // Make result text visible
        result.isHidden = false

        // Check if inputNumber is a number and not 0
        if (inputInt != nil && inputInt! != 0) {

            // If the random is 0, the coin is heads
            if (randNum == 0) {
                coinImage.image = UIImage(named: "c0")
                headCount += 1
                headsCounter.text = "Heads Counter: \(headCount)"
                result.text = "You flipped heads! NICE!"
                result.textColor = UIColor.green
            
                // When Heads count is half way
                if (headCount == inputInt! / 2) {
                    result.text = "That is it we are getting there!"
                    result.textColor = UIColor.green
                }
                // When Heads count is close to the user input
                if (headCount == inputInt! - 2) {
                    result.text = "You are almost there!"
                    result.textColor = UIColor.yellow
                }
                // When Heads count is 1 less than the user input
                if (headCount == inputInt! - 1) {
                    result.text = "So close now CHAMP"
                    result.textColor = UIColor.orange
                }
            
            } else { // Else the coin is tails
                coinImage.image = UIImage(named: "c1")
                headCount = 0
                tryCount += 1
                triesCounter.text = "Tries Counter: \(tryCount)"
                headsCounter.text = "Heads Counter: \(headCount)"
                result.text = "You flipped tails! Keep trying!"
                result.textColor = UIColor.red
            }
        } else { // Alert if inputNumber is not a number or empty
            let alert = UIAlertController(title: "Error", message: "Please enter a number greater than 0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            result.isHidden = true
        }
        
        // When headCount is equal to inputNumber, show the congrats alert
        if (headCount == inputInt) {
            let alert = UIAlertController(title: "AWESOME, You did it! Congrats CHAMP", message: "You got \(headCount) heads in a row in \(tryCount) tries", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            headCount = 0
            tryCount = 1
            headsCounter.text = "Heads Counter: \(headCount)"
            triesCounter.text = "Tries Counter: \(tryCount)"
        }
    }
}
