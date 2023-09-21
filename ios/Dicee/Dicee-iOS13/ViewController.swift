//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    let diceImages = ["One", "Two", "Three", "Four", "Five", "Six"]
        .map { UIImage(named: "Dice\($0)") }

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageViewOne.image = diceImages.randomElement()!
        diceImageViewTwo.image = diceImages.randomElement()!
    }
    
}

