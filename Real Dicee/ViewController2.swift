//
//  ViewController2.swift
//   Dicee
//
//  Created by Abdelrahman Samy on 28.02.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var Dices1: UIImageView!
    @IBOutlet weak var Dices2: UIImageView!
    
    
    @IBAction func Roll(_ sender: Any) {
        
        animate_images()

    }
    
    func animate_images()
    {
        let DiceArray = [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3") , #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "6")]

        for i in 0..<DiceArray.count
        {
            Dices1.image = DiceArray.randomElement()
            Dices2.image = DiceArray.randomElement()
        }

        Dices1.animationImages = DiceArray
        Dices1.animationDuration = 0.5
        Dices1.animationRepeatCount = 1
        Dices1.startAnimating()
        
        Dices2.animationImages = DiceArray
        Dices2.animationDuration = 0.5
        Dices2.animationRepeatCount = 1
        Dices2.startAnimating()
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
