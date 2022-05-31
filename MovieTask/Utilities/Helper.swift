//
//  Helper.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 2/25/21.
//

import UIKit

struct Helper{
            
    static func emptyMessageInCollectionView(_ collectionView: UICollectionView,_ title: String){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
        noDataLabel.textColor        = .lightGray
        noDataLabel.font             = UIFont(name: "Open Sans", size: 15)
        noDataLabel.textAlignment    = .center
        collectionView.backgroundView = noDataLabel
        noDataLabel.text = title
    }
    
    //MARK:- Alert Helpers

    static func showAlert(msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        let mwindow = UIApplication.shared.keyWindow!
        guard let parentVC = mwindow.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    static func getMilSecToDateStr(milSec: Int)-> String{
        let date = Date(timeIntervalSince1970: TimeInterval((milSec / 1000)))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStr = dateFormatter.string(from: date)
        return dateStr
    }

}
