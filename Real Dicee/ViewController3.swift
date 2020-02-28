//
//  ViewController2.swift
//   Dicee
//
//  Created by Abdelrahman Samy on 28.02.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//


import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var coin: UIImageView!
   
     
       @IBAction func Roll(_ sender: Any) {
           
           let DiceArray = [#imageLiteral(resourceName: "head"), #imageLiteral(resourceName: "tail")]
           
        for i in 0..<DiceArray.count
               {
                   coin.image = DiceArray.randomElement()
               }

               coin.animationImages = DiceArray
               coin.animationDuration = 0.09
               coin.animationRepeatCount = 10
               coin.startAnimating()
               
       
       }
        
    @IBAction func back(_ sender: Any) {
      self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
