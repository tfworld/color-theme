//
//  FirstViewController.swift
//  Color Theme
//
//  Created by David Johnson on 10/12/16.
//  Copyright © 2016 TFWorld Software. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet var button:UIButton!
    @IBOutlet var label:UILabel!
    @IBOutlet var control:UISegmentedControl!
    @IBOutlet var switchL:UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainController.changeColor), name: NSNotification.Name("updateColor"), object: nil)
        
        //final setup
        self.button.layer.cornerRadius = 10.0
        self.changeColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeColor() {
        
        //set tabBar icons
        self.tabBarController?.tabBar.tintColor = ColorCatalog.sharedManager.getColor()
        
        //set button
        self.button.backgroundColor = ColorCatalog.sharedManager.getColor()
        self.button.tintColor = UIColor.white
        self.button.titleLabel?.text = ColorCatalog.sharedManager.catalog[ColorCatalog.sharedManager.index]

        //set label color and string
        self.label.textColor = ColorCatalog.sharedManager.getColor()
        self.label.text = ColorCatalog.sharedManager.catalog[ColorCatalog.sharedManager.index]
        
        //set Segmented Control color
        self.control.tintColor = ColorCatalog.sharedManager.getColor()
        
        //set switch color
        self.switchL.onTintColor = ColorCatalog.sharedManager.getColor()
        
    }


}

