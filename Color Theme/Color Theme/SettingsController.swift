//
//  SecondViewController.swift
//  Color Theme
//
//  Created by David Johnson on 10/12/16.
//  Copyright © 2016 TFWorld Software. All rights reserved.
//

import UIKit

class ColorCellMain : UITableViewCell {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var color:UIImageView!
}

class SettingsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainController.changeColor), name: NSNotification.Name("updateColor"), object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCellMain", for: indexPath) as! ColorCellMain
        
        cell.label?.text = "Current Color"
        cell.color.backgroundColor = ColorCatalog.sharedManager.getColor()
        cell.color.layer.cornerRadius = 10
        cell.accessoryView = self.setAccessory()
        cell.selectedBackgroundView = self.setBackgroundColor()
        
        return cell
    }
    
    func setAccessory() -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 16, height: 36))
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = ">"
        label.textAlignment = .right
        label.textColor = ColorCatalog.sharedManager.getColor()
        
        return label
    }
    
    func setBackgroundColor() -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = ColorCatalog.sharedManager.getColor()
        
        return backgroundView
    }
    
    func changeColor() {
        self.tableView.reloadData()
    }

}

