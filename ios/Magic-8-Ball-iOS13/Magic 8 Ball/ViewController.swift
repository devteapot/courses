//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = (1...5)
        .map {
            UIImage(named: "ball\($0)")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        imageView.image = ballArray[2];
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        imageView.image = ballArray.randomElement()!;
    }
}
