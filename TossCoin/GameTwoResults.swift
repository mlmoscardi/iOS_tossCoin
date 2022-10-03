
import UIKit

class GameTwoResults: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var gameResultsText: UILabel!
    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var bottomTableView: UITableView!
    
    // All arrays received from GameTwo
    var playersArray = [String]()
    var winnersArray = [String]()
    
    // Variables from GameTwo
    var inputPlayers = String()
    var inputFlip = String()
    var headsCountTotal = Int()

    // New arrays to contain info
    var topData = [String]()
    var bottomData = [String]()
    
    // Main Function
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        topTableView.delegate = self
        topTableView.dataSource = self
        bottomTableView.delegate = self
        bottomTableView.dataSource = self

        // Iterate through playersArray and append to topData
        for index in 0..<playersArray.count {
            topData.append(playersArray[index])
        }

        // Iterate through winnersArray and append to bottomData
        for index in 0..<winnersArray.count {
            bottomData.append(winnersArray[index])
        }

        // Preset stroke color and stroke width
        let attrString = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.strokeWidth : -2.0,
        ] as [NSAttributedString.Key : Any]

        // Set font attributes
        gameResultsText.attributedText = NSAttributedString(string: "Game Results", attributes: attrString)
        
        // Resize Text
        gameResultsText.sizeToFit()
    }

    // Functions for the TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.red
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
            case topTableView:
                numberOfRow = topData.count
            case bottomTableView:
                numberOfRow = bottomData.count
            default:
                print("Error")
        }
        return numberOfRow
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch tableView {
            case topTableView:
                title = "\(inputPlayers) Players played and flipped the coin \(inputFlip) times"
            case bottomTableView:
                title = "There were \(headsCountTotal) Winners"
            default:
                print("Error")
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView {
            case topTableView:
                cell = tableView.dequeueReusableCell(withIdentifier: "playersCell", for: indexPath)
                cell.textLabel?.text = topData[indexPath.row]
            case bottomTableView:
                cell = tableView.dequeueReusableCell(withIdentifier: "winnersCell", for: indexPath)
                cell.textLabel?.text = bottomData[indexPath.row]
            default:
            print("Error")
        }
        return cell
    }
}
