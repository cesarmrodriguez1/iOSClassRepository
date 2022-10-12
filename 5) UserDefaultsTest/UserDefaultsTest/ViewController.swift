//
//  ViewController.swift
//  UserDefaultsTest
//
//  Created by profesor on 12/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let csKey = "csKey"
    
    
    @IBOutlet weak var textDefault: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveDefault(_ sender: Any) {
        if textDefault.text?.isEmpty == true{
           displayMessage(message: "Textfield is empty, please type a value")
        }
        else{
            defaults.set(textDefault.text!, forKey: csKey)
            defaults.synchronize()
            displayMessage(message: "Data was saved successfully!!")
        }
    }
    
    @IBAction func viewDefault(_ sender: Any) {
        if let value = defaults.string(forKey: csKey){
            displayMessage(message: value)
        }
        else{
            displayMessage(message: "No User Default was saved previously!!")
        }
    }
    
    @IBAction func removeDefault(_ sender: Any) {
        if let value = defaults.string(forKey: csKey){
            defaults.removeObject(forKey: csKey)
            defaults.synchronize()
            displayMessage(message: value + "was removed from User Defaults")
        }
        else{
            displayMessage(message: "No User Default was saved previously!!")
        }
    }
    
    func displayMessage(message: String){
        let alert = UIAlertController(title: "App message", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

