//
//  MainViewController.swift
//  Real Dicee
//
//  Created by Abdelrahman Samy on 28.02.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        dicee.layer.cornerRadius = 10
        diceeAR.layer.cornerRadius = 10
        headOR.layer.cornerRadius = 10
        
    }
    
    
    @IBOutlet weak var dicee: UIButton!
    
    @IBOutlet weak var diceeAR: UIButton!
    
    @IBOutlet weak var headOR: UIButton!
    
}
