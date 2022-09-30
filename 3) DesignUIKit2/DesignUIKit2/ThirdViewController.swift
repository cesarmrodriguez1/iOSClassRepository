//
//  ThirdViewController.swift
//  DesignUIKit2
//
//  Created by profesor on 26/09/22.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var contacts: [Contact] = []
    var people : [String] = []
    var avatars : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        people = ["Armando Román", "Asael Martínez", "Jonathan Rivas", "Ana Sánchez", "Juan Antonio Macías", "Ken Bauer", "Alejandra Bautista", "Mario Hernández", "Juan Pérez", "Luis Naranjo", "Moni González", "Linda Soto", "Diego Ávalos", "Yusu Tamayo", "Frida Lucedh Hernández"]
                
        avatars = ["avatar1", "avatar2", "avatar2", "avatar14", "avatar1", "avatar4", "avatar14", "avatar7", "avatar5", "avatar7", "avatar6", "avatar11", "avatar2", "avatar5", "avatar2"]
        
        
        for index in 0...14
        {
            contacts.append(Contact(avatarName: avatars[index], personName: people[index]))
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel?.text = contacts[indexPath.row].personName
        cell.imageView?.image = UIImage(named: contacts[indexPath.row].avatarName)
        
        return cell
        
    }
}

