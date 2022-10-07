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
        if segue.identifier != "goRegister"{
            let item = sender as? UITableViewCell
            let indexPath = myTableView.indexPath(for: item!)
            let updateVC = segue.destination as! UpdateViewController
            
            updateVC.key = items[(indexPath?.row)!].key
            
            
            
            
        }
        
        
        
        
        
    }
}

