//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let EggTimes: [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]

    @IBAction func eggPressed(_ sender: UIButton) {
        
        let hardness: String? = sender.currentTitle
        print(EggTimes[hardness!]!)
    }
    
}
