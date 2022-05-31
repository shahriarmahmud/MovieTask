//
//  MTMovieCell.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 2/28/21.
//

import UIKit
import SDWebImage

class MTMovieCell: UICollectionViewCell {
    
    @IBOutlet weak private var titleImageView: UIImageView!
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var genre: UILabel!
    @IBOutlet weak private var artistNameLbl: UILabel!
    
    static let identifire = "MTMovieCell"
    
    func configureCell(viewModel: MTDashboardVM, index: Int){
        titleLbl.text = viewModel.getTitle(index: index)
        genre.text = "popularity Rank: \(viewModel.getPopularityRank(index: index))"
        artistNameLbl.text = viewModel.getArtistName(index: index)
        
        let artKey = viewModel.getArtKey(index: index)
        let imageUrl = Constants.getimageURL(artKey: artKey)
        
        titleImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder"))
    }
    
}
