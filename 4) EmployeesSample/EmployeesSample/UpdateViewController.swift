//
//  UpdateViewController.swift
//  EmployeesSample
//
//  Created by profesor on 07/10/22.
//

import UIKit
import Firebase

class UpdateViewController: UIViewController{
    
    
    @IBOutlet weak var labelKey: UILabel!
    
    
    @IBOutlet weak var textName: UITextField!
    
    
    
    @IBOutlet weak var textArea: UITextField!
    
    
    
    @IBOutlet weak var textStatus: UITextField!
    
    
    var key = ""
    
    let ref = Database.database().reference(withPath:"Employees")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.child(self.key).observeSingleEvent(of: .value, with: { snapshot in
            
            let value = snapshot.value as? NSDictionary
            let currentKey = self.key
            let name = value?["name"] as? String ?? "Unknown"
            let area = value?["area"] as? String ?? "Unknown"
            let status = value?["status"] as? String ?? "Unknown"
            
            self.labelKey.text = currentKey
            self.textName.text = name
            self.textArea.text = area
            self.textStatus.text = status
            
        })
    }
    
    
    @IBAction func updateEmployee(_ sender: Any) {
        let key = self.key
        let object: [String:Any] = [
            "name":self.textName.text!,
            "area":self.textArea.text!,
            "status":self.textStatus.text!
        ]
        
        ref.child(key).setValue(object){
            (error:Error?, ref:DatabaseReference) in
            
            var message = ""
            
            if let error = error{
                message = "An error occurred"
                print(error)
            } else{
                message = "Data was updated successfully"
            }
            
            let alertController = UIAlertController(title: "App message", message: message, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default){ (alert:UIAlertAction) in
                
                print("OK was pressed")
            }
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func deleteEmployee(_ sender: Any) {
        ref.child(self.key).setValue(nil){
            (error:Error?, ref:DatabaseReference) in
            
            var message = ""
            
            if let error = error{
                message = "An error occurred"
                print(error)
            } else{
                message = "Data was removed successfully"
            }
            
            let alertController = UIAlertController(title: "App message", message: message, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default){ (alert:UIAlertAction) in
                
                print("OK was pressed")
            }
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion: nil)
    }
  }
}
