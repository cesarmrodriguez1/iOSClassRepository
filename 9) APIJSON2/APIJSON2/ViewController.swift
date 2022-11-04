//
//  ViewController.swift
//  APIJSON2
//
//  Created by profesor on 02/11/22.
//

import UIKit
import SVGKit
import SVGKitSwift

// MODEL:

struct Nation{
    let country: String
    let flag: String
    let code: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var countries  : [Nation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://gist.githubusercontent.com/pratikbutani/20ded7151103bb30737e2ab1b336eb02/raw/be1391e25487ded4179b5f1c8eedb81b01226216/country-flag.json")
        
        //Communicate to API:
        
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            
            if error != nil{
                print(error!)
            }
            else{
                if let urlContent = data{
                    do{
                        let nations = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        for i  in 0...nations.count - 1 {
                            let dictionary = nations.object(at: i) as! NSDictionary
                            
                            let mycountry = Nation(country: (dictionary["country"] ?? "No country available") as! String, flag: (dictionary["flag"] ?? "No flag available") as! String, code: (dictionary["code"] ?? "No code available") as! String)
                            
                            self.countries.append(mycountry)
                        }
                    }catch{
                        print("There was a problem while processing JSON")
                    }
                }
            }
        }
        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel?.text = countries[indexPath.row].country
        
        let flag = SVGKImage(contentsOf: URL(string: countries[indexPath.row].flag)!)
        
        cell.imageView!.image = flag!.uiImage
        
        return cell
    }
}

