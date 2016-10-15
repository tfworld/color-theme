//
//  ColorCatalog.swift
//  Color Theme
//
//  Created by David Johnson on 9/28/16.
//  Copyright © 2016 TFWorld Software. All rights reserved.
//

import UIKit

class ColorCatalog {
    
    var index:Int = 0
    var catalog:[String] = ["Gray", "Black", "Green", "Red", "Pink", "Purple", "Blue", "Light Blue", "Orange", "Brown", "Yellow"]
    
    static let sharedManager = ColorCatalog()
    
    func getColor( _ newColor:String ) -> UIColor {
        
        var colorRGB = UIColor.clear
        
        switch newColor {
        case "White":
            colorRGB = UIColor.white
        case "Black":
            colorRGB = UIColor.black
        case "Red":
            colorRGB = UIColor.red
        case "Orange":
            colorRGB = UIColor.orange
        case "Yellow":
            colorRGB = UIColor.yellow
        case "Green":
            colorRGB = UIColor.green
        case "Blue":
            colorRGB = UIColor.blue
        case "Pink":
            colorRGB = UIColor(red: 0.918, green: 0.298, blue: 0.537, alpha: 1.0)
        case "Purple":
            colorRGB = UIColor.purple
        case "Gray":
            colorRGB = UIColor.gray
        case "Light Blue":
            colorRGB = UIColor.cyan
        case "Brown":
            colorRGB = UIColor.brown
        default:
            colorRGB = UIColor.black
        }
        
        
        return colorRGB
        
    }
    
    func getColor() -> UIColor {
        
        return getColor( catalog[index] )
    }
    
    func getColor( _ index:Int ) -> UIColor {
        return getColor( catalog[index] )
    }
    
    func save() {
        UserDefaults.standard.set(index, forKey: "color")
        UserDefaults.standard.synchronize()
        
        //Notification to update Colors
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateColor"), object: nil)
        
    }
    
    init() {
        index = UserDefaults.standard.integer(forKey: "color")
        
    }
    
}
