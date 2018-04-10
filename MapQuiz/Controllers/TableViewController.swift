import UIKit
import ChameleonFramework

class TableViewController: UITableViewController {
    
    @IBOutlet weak var firstClassView: UIView!
    
    
    @IBAction func firstClassBtnPressed(_ sender: UIButton) {
        
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(1332292596)"
            ),
            UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
                print("магазин")
            }
        }
    }

    
    var data = [String]()
    var segueIdentifiers = ["A"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = ["Градове в България"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = data[indexPath.row]
        
      if let colour =  FlatWatermelon().darken(byPercentage: CGFloat(indexPath.row)/(CGFloat(data.count) + CGFloat(3))) {

        cell.backgroundColor = colour
        cell.textLabel?.textColor = ContrastColorOf(colour, returnFlat: true)

            print(CGFloat(indexPath.row)/(CGFloat(data.count)  + CGFloat(3)))

        }

        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            tableView.rowHeight = 70
            firstClassView.frame.size.height = 70
        }else{
            tableView.rowHeight = 120
            firstClassView.frame.size.height = 120
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: self)
    }
}


