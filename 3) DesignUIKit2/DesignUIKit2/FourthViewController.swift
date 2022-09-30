//
//  FourthViewController.swift
//  DesignUIKit2
//
//  Created by profesor on 28/09/22.
//


import UIKit

class FourthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var BookCollection: UICollectionView!
    
    
    let bookNames = ["Amar es para valientes","Bajo un cielo escarlata", "Breve historia del tiempo", "Cerebro de pan","Despues el anochecer", "El murmullo de las abejas", "El nombre de la rosa", "El Palacio de la Luna", "El ruisenor",
        "Forex", "Hija de la fortuna", "Investor Coach", "La emperatriz de la luna", "La niebla",
        "La niña alemana", "La teoria del todo", "La viajera del tiempo", "Los cuatro acuerdos",
        "Nocturno de la democracia mexicana", "Peregrinos", "Sapiens", "Siempre amigos", "Star Wars"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "Item"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! BookCollectionViewCell
        
        cell.bookImageView.image = UIImage(named: bookNames[indexPath.row])
        
        return cell
    }
}
