//
//  ViewController.swift
//  MyFirstiOSApp
//
//  Created by profesor on 21/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var buttonPressMe: UIButton!
    
    
    @IBOutlet weak var buttonOne: UIButton!
    
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    
    @IBOutlet weak var buttonThree: UIButton!
    
    
    @IBOutlet weak var buttonGetNumbers: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        let defaultAction = UIAlertAction(title: "Agree", style: .default) { (action) in
            // Response to user action-
                    
        }
        let cancelAction = UIAlertAction(title: "Disagree", style: .cancel) { (action) in
            //What to do when cancel is selected
            
        }
        
        let alert = UIAlertController(title: "Terms and conditions",
                                      message: "Click agree to accept terms and conditions",
                                      preferredStyle: .alert)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
        
    }
    
    
    @IBAction func getNumbersPressed(_ sender: Any) {
        buttonOne.setTitle(String(Int.random(in: 0..<9)), for: UIControl.State.normal)
        buttonTwo.setTitle(String(Int.random(in: 0..<7)), for: UIControl.State.normal)
        buttonThree.setTitle(String(Int.random(in: 0..<5)), for: UIControl.State.normal)
    }
    
    
    
    

}

