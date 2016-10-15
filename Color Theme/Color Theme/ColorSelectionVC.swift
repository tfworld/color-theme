//
//  ColorSelectionVC.swift
//  Color Theme
//
//  Created by David Johnson on 10/12/16.
//  Copyright © 2016 TFWorld Software. All rights reserved.
//

import UIKit

class ColorCell : UITableViewCell {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var color:UIImageView!
    @IBOutlet var checkMark:UIImageView!
}

class ColorSelectionVC : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let row = ColorCatalog.sharedManager.index
        let path:IndexPath = IndexPath(row: row, section: 0)
        self.tableView.selectRow(at: path, animated: false, scrollPosition: .bottom)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ColorCatalog.sharedManager.catalog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let colorCell = self.tableView.dequeueReusableCell(withIdentifier: "colorCell") as! ColorCell
        colorCell.label?.text = ColorCatalog.sharedManager.catalog[indexPath.row]
        colorCell.color.backgroundColor = ColorCatalog.sharedManager.getColor(indexPath.row)
        colorCell.color.layer.cornerRadius = 10
        if indexPath.row == ColorCatalog.sharedManager.index {
            colorCell.checkMark.isHidden = false
        }
        return colorCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row)")
        
        let cell = tableView.cellForRow(at: indexPath) as! ColorCell
        cell.checkMark.isHidden = false
            
        //save color
        ColorCatalog.sharedManager.index = indexPath.row
        ColorCatalog.sharedManager.save()
            
        NotificationCenter.default.post(name: NSNotification.Name("changeColor"), object: nil)
            
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ColorCell
        cell.checkMark.isHidden = true
    }
    
    func setBackgroundColor() -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = ColorCatalog.sharedManager.getColor()
        
        return backgroundView
    }
}
