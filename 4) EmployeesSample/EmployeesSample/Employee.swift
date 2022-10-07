//
//  Employee.swift
//  EmployeesSample
//
//  Created by profesor on 05/10/22.
//

import Foundation
import Firebase

struct Employee{
    let ref: DatabaseReference?
    let key: String
    let name: String
    let area: String
    let status: String
    
    init(name: String, area: String, status: String, key: String = ""){
        self.ref = nil
        self.key = key
        self.name = name
        self.area = area
        self.status = status
    }
    
    init?(snapshot: DataSnapshot){
        guard
            let value = snapshot.value as? [String:AnyObject],
            let name = value["name"] as? String,
            let area = value["area"] as? String,
            let status = value["status"] as? String
        else{
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.area = area
        self.status = status
        
    }
    
    func toAnyObject()->Any {
        return[
            "name":name,
            "area":area,
            "status":status
        ]
    }
}
