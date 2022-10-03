import UIKit

class SplashScreen: UIViewController {
    
    // Outlets
    @IBOutlet weak var logo_v: UIImageView!
    @IBOutlet weak var pBar: UIProgressView!
    @IBOutlet weak var nProgress: UILabel!
    // Variables
    var progressBar: Float = 0.0
    var numberProgress = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Logo Animation
        UILabel.animate(withDuration: 5.0) {
            self.logo_v.alpha = 1
        }

        // Set Progress bar height
        pBar.transform = pBar.transform.scaledBy(x: 1, y: 5)

        // Progress bar and Percentage animation
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            self.progressBar += 0.01
            self.pBar.setProgress(self.progressBar, animated: true)
            self.numberProgress += 1
            self.nProgress.text = "\(self.numberProgress) %"
            if self.numberProgress >= 100 {
                timer.invalidate()
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.2) {
                self.performSegue(withIdentifier: "toMainPage", sender: nil)
            }
        }
        




    
    }
}

