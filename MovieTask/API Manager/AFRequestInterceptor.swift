//
//  AFRequestInterceptor.swift
//  MovieTask
//
//  Created by Shahriar Mahmud on 4/7/20.
//  Copyright © 2020 Shahriar Mahmud. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

final class AFRequestInterceptor: Alamofire.RequestInterceptor {
    
    private var accessToken: String
    var isFirstAuthenticationFailed = true
    var presentedAlert: UIAlertController?
    
    // https://github.com/Alamofire/Alamofire/issues/2998
    typealias AdapterResult = Swift.Result<URLRequest, Error>
    
    init(token:String) {
        self.accessToken = token
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, let errorCode = APIError(rawValue: response.statusCode) else {
            /// The request did not fail due to a 401 Unauthorized response.
            /// Return the original error and don't retry the request.
            isFirstAuthenticationFailed = true
            return completion(.doNotRetryWithError(error))
        }
        
        switch errorCode {
        case .unauthorized:
            DLog("******** Get Access Token ********")
            return completion(.doNotRetry)
            
        case .timeOut:
            DLog("******** REQUEST TIME OUT ********")
            DLog("Retry Count = \(request.retryCount)")
            DLog("requested URL = \(String(describing: response.url))")
            if request.retryCount == 3 {
                return completion(.doNotRetry) }
            return completion(.retryWithDelay(1.0)) // retry after 1 second
        case .invalidParam:
            DLog("************ ============ ************")
            DLog("******* WRONG PARAMETER SEND TO API *******")
            completion(.doNotRetry)
        case .notFound:
            DLog("************ ============ ************")
            DLog("******* NOT FOUND IN SERVER *******")
            completion(.doNotRetry)
        case .dependencyFail:
            DLog("************ ============ ************")
            DLog("******* BACKEND FAILD FOR DEPENDENCY *******")
            completion(.doNotRetry)
        case .serverProblem:
            DLog("************ ============ ************")
            DLog("******* BACKEND INTERNAL SERVER PROBLEM *******")
            completion(.doNotRetry)
        case .preconditioned:
            DLog("************ ============ ************")
            DLog("******* PRE CONDITION FAILED *******")
            completion(.doNotRetry)
        case .sessionExpired:
            DLog("************ ============ ************")
            DLog("******* SESSION EXPIRED *******")
            completion(.doNotRetry)
        }
    }
}
