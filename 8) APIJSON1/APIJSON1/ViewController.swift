//
//  ViewController.swift
//  APIJSON1
//
//  Created by profesor on 31/10/22.
//

import UIKit

// MODEL:

struct Fruit: Codable{
    let name: String
    let image: String
    let price: Int
}

struct Fruits: Codable{
    var fruits: [Fruit]
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    
    var myfruits: [Fruit] = [] // All fruits in JSON
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let url = URL(string: "https://gist.githubusercontent.com/amlcurran/6d174c472e2523be5f9cad7092e1d7ab/raw/edfb73c8ade674f40bfff8f3dfed97d327c1abc1/fruits.json"){
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let obtained = data{
                    do{
                        let results = try JSONDecoder().decode(Fruits.self, from: obtained)
                        
                        for result in results.fruits{
                            self.myfruits.append(Fruit(name: result.name, image: result.image, price: result.price))
                            
                            print(result.image)
                            
                        }
                    }catch let error{
                        print(error)
                    }
                    DispatchQueue.main.async{
                        self.ProductCollectionView.reloadData()
                    }
                }
            }.resume()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myfruits.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "Item"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell.productLabel.text = self.myfruits[indexPath.row].name
        
        cell.productImageView.downloadedFrom(from: self.myfruits[indexPath.row].image)
        
        return cell
    }
}


extension UIImageView{
    func downloadedFrom(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else{ return}
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloadedFrom(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return}
        downloadedFrom(from: url, contentMode: mode)
    }
}

