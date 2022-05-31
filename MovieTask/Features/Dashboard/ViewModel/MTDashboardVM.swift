//
//  MTDashboardVM.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 2/28/21.
//

import Foundation
import SVProgressHUD


class MTDashboardVM{
    
    private var movieList: [MovieResponse]?
    private var movideDetails: MovideDetailsResponse?
    
    func getMovieList(completion: @escaping (_ success: Bool) -> Void){
        SVProgressHUD.show()
        APIClient.shared.objectAPICall(apiEndPoint: DashboardEndPoint.getMovieList, modelType: [MovieResponse].self) { (response) in
            switch response {
            case .success(let value):
                SVProgressHUD.dismiss()
                self.movieList = value
                completion(true)
            case .failure((let code, let data, let err)):
                SVProgressHUD.dismiss()
                DLog("code = \(code)")
                DLog("data = \(String(describing: data))")
                DLog("error = \(err.localizedDescription)")
                completion(false)
            }
        }
    }
    
    func getMovieDetails(titleId: Int, completion: @escaping (_ success: Bool) -> Void){
        SVProgressHUD.show()
        APIClient.shared.objectAPICall(apiEndPoint: DashboardEndPoint.getMovieDetails(titleId: titleId), modelType: MovideDetailsResponse.self) { (response) in
            switch response {
            case .success(let value):
                SVProgressHUD.dismiss()
                self.movideDetails = value
                completion(true)
            case .failure((let code, let data, let err)):
                SVProgressHUD.dismiss()
                DLog("code = \(code)")
                DLog("data = \(String(describing: data))")
                DLog("error = \(err.localizedDescription)")
                completion(false)
            }
        }
    }
    
    func getMovideList()->[MovieResponse]{
        guard let list = movieList else {return [MovieResponse]()}
        return list
    }
    
    func getTitleId(index: Int)->Int{
        guard let titleId = movieList?[index].titleId else {return 0}
        return titleId
    }
    
    func getTitle(index: Int)->String{
        guard let title = movieList?[index].title else {return ""}
        return title
    }
    
    func getArtistName(index: Int)->String{
        guard let artistName = movieList?[index].artistName else {return ""}
        return artistName
    }
    
    func getArtKey(index: Int)->String{
        guard let artKey = movieList?[index].artKey else {return ""}
        return artKey
    }
    
    func getPopularityRank(index: Int)->Int{
        guard let popularityRank = movieList?[index].popularityRank else {return 0}
        return popularityRank
    }
    
    
    // Mark:- Detials
    
    
    
    func getPublisherName()->String{
        guard let title = movideDetails?.publisherName else {return ""}
        return title
    }
    
    func getTitleDetails()->String{
        guard let publisherName = movideDetails?.title else {return ""}
        return publisherName
    }
    
    func getSynopsis()->String{
        guard let synopsis = movideDetails?.synopsis else {return ""}
        return synopsis
    }
    
    func getLanguage()->String{
        guard let language = movideDetails?.language else {return ""}
        return language
    }
    
    func getReleaseDate()->Int{
        guard let releaseDate = movideDetails?.releaseDate else {return 0}
        return releaseDate
    }
    
    func getArtis()->[Artist]{
        guard let list = movideDetails?.artists else {return [Artist]()}
        let artists = list.filter { (model) -> Bool in
            return model.relationship == "ACTOR"
        }
        return artists
    }
    
    func getDirector()->[Artist]{
        guard let list = movideDetails?.artists else {return [Artist]()}
        let director = list.filter { (model) -> Bool in
            return model.relationship == "DIRECTOR"
        }
        return director
    }
    
    func getRating()->String{
        guard let rating = movideDetails?.rating else {return "N/A"}
        return rating
    }
    
    func getGenres()->[Genres]{
        guard let genres = movideDetails?.genres else {return [Genres]()}
        return genres
    }
}





