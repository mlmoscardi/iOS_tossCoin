import UIKit

class MainPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func gameOneBtn(_ sender: Any) {
        performSegue(withIdentifier: "toGameOne", sender: nil)
    }
    
    @IBAction func gameTwoBtn(_ sender: Any) {
        performSegue(withIdentifier: "toGameTwo", sender: nil)
    }
}
