//
//  MTDashboardVC.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 2/28/21.
//

import UIKit

class MTDashboardVC: UIViewController {

    @IBOutlet weak private var clcView: UICollectionView!
    
    private let viewModel = MTDashboardVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }
    
    private func getData(){
        viewModel.getMovieList {[weak self] (success) in
            if success{
                self?.clcView.reloadData()
            }
        }
    }
}

extension MTDashboardVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.getMovideList().count == 0 {
            Helper.emptyMessageInCollectionView(collectionView, "No data available")
        }else{
            collectionView.backgroundView = nil
        }
        return viewModel.getMovideList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MTMovieCell.identifire, for: indexPath) as! MTMovieCell
        cell.configureCell(viewModel: viewModel, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 20)/2
        return CGSize(width: width, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let titleId = viewModel.getTitleId(index: indexPath.row)
        let artKey = viewModel.getArtKey(index: indexPath.row)
        let imageUrl = Constants.getimageURL(artKey: artKey)
        
        showMovieDetails(imageUrl: imageUrl, titleId: titleId)

    }
    
    private func showMovieDetails(imageUrl: String, titleId: Int){
        let storyboard = UIStoryboard(storyboard: .dashboard)
        let vc = storyboard.instantiateViewController(withIdentifier: MTMovieDetailsVC.self)
        vc.viewModel = self.viewModel
        vc.imageUrl = imageUrl
        vc.titleId = titleId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
