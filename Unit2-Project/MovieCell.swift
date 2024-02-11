//
//  MovieCell.swift
//  Unit2-Project
//
//  Created by A Rufin on 1/26/24.
//
import Nuke
import NukeExtensions
import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with movie: Movie)
    {
        movieDescLabel.text = movie.overview
        movieNameLabel.text = movie.original_title
        
        loadImage(with: URL(string: movie.pImg_URL + movie.poster_path), into: movieImageView)
    }

    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
}
