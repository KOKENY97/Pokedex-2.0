

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PokeCell
        
        cell.nameLbl.text = pokemons[indexPath.row].nome
        cell.nameLbl.backgroundColor = pokemons[indexPath.row].cor
        cell.idLbl.text = "#\(pokemons[indexPath.row].id)"
        cell.idLbl.textColor = pokemons[indexPath.row].cor
        
        cell.layer.cornerRadius = 9.0
        cell.layer.borderWidth = 1
        cell.layer.borderColor = pokemons[indexPath.row].cor.cgColor
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You pressed on \(pokemons[indexPath.row].nome)")
    }
}

