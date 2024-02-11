//
//  DetailViewController.swift
//  Unit2-Project
//
//  Created by A Rufin on 1/26/24.
//

import Foundation
import UIKit
import Nuke
import NukeExtensions

class DetailViewController: UIViewController {
    var movie: Movie!
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var votesAverageLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage(with: URL(string: movie.pImg_URL + movie.poster_path), into: posterImageView)
        
        titleLabel.text = movie.original_title
        votesCountLabel.text = String("\(movie.vote_count) Votes")
        votesAverageLabel.text = String("\(movie.vote_average) Average votes")
        popLabel.text = String("\(movie.popularity) Popularity")
        descLabel.text = movie.overview
    }
}
