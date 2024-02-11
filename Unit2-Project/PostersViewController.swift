//
//  PostersViewController.swift
//  Unit2-Project
//
//  Created by A Rufin on 2/11/24.
//

import UIKit
import Nuke
import NukeExtensions
class PostersViewController: UIViewController, UICollectionViewDataSource {
    var posters: [Poster] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let poster = posters[indexPath.item]
        let imageURL = URL(string: Poster.PosterUrl + poster.poster_path)!
        loadImage(with: imageURL, into: cell.posterImageView)
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=907b58a2543c822ec3fb4b77c785507b")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){[weak self] data, response, error in
            
            if let error = error {
                    print("❌ Network error: \(error.localizedDescription)")
                }

                // Make sure we have data
                guard let data = data else {
                    print("❌ Data is nil")
                    return
                }
                let decoder = JSONDecoder()
                do {
                    // Try to parse the JSON into a dictionary (aka: [String: Any])
                    let response = try decoder.decode(PosterResponse.self, from: data)
                    let posters = response.results
                    print(posters)
                    
                    DispatchQueue.main.async {
                        self?.posters = posters
                        self?.collectionView.reloadData()
                    }

                } catch {
                    print("❌ Error parsing JSON: \(error.localizedDescription)")
                }
        }
        task.resume()
        
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 0

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 2
        let numberOfRows: CGFloat = 4

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width)/numberOfColumns
        let height = (collectionView.bounds.height)/numberOfRows
        
        // Set the size that each item/cell should display at
        layout.itemSize = CGSize(width: width, height: height)

        
    }

    @IBOutlet weak var collectionView: UICollectionView!
}
