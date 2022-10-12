//
//  ViewController.swift
//  EmployeesSample
//
//  Created by profesor on 05/10/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var myTableView: UITableView!
    
    let ref = Database.database().reference(withPath: "Employees")
    var items: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let value = UserDefaults.standard.string(forKey: "loggedUser"){
            
            ref.observe(.value, with: { snapshot in
                print(snapshot.value as Any)
            })
            
            ref.observe(.value, with: { snapshot in
                var newEmployee: [Employee] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                       let employees = Employee(snapshot: snapshot){
                        newEmployee.append(employees)
                    }
                }
                self.items = newEmployee
                self.myTableView.reloadData()
            })
            
            displayMessage(message: "User "+value+" is now logged in")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let value = UserDefaults.standard.string(forKey: "loggedUser"){
            displayMessage(message: "User "+value+" is now logged in")
        }
        else{
            var waitAlert: UIAlertController
            var indicator: UIActivityIndicatorView
            waitAlert = UIAlertController(title: "Please wait. . .", message: nil, preferredStyle: .alert)
            
            indicator = UIActivityIndicatorView(frame: waitAlert.view.bounds)
            indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            waitAlert.view.addSubview(indicator)
            indicator.isUserInteractionEnabled = false
            indicator.startAnimating()
            
            self.present(waitAlert, animated: true, completion: nil)
            
            print("No User Default Available")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute:{
                waitAlert.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "logOut", sender: nil)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        let employeeObject = items[indexPath.row]
        cell.textLabel?.text = employeeObject.name + " "+employeeObject.status
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "logOut":
            if let value = UserDefaults.standard.string(forKey: "loggedUser"){
                DispatchQueue.main.async(execute: {
                    UserDefaults.standard.removeObject(forKey: "loggedUser")
                    UserDefaults.standard.synchronize()
                })
                print(value+" has logged out")
            }
        break
            
        case "update":
            let item = sender as? UITableViewCell
            let indexPath = myTableView.indexPath(for: item!)
            let updateVC = segue.destination as! UpdateViewController
            
            updateVC.key = items[(indexPath?.row)!].key
            break
            
        default: break
            
        }

    }
    
    func displayMessage(message: String){
        let alert = UIAlertController(title: "App message", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

