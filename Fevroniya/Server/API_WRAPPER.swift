//
//  API_WRAPPER.swift
//  Fevroniya
//
//  Created by Егор on 03.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import Foundation
import SwiftyJSON

class API_WRAPPER {
  private  class func makeRequest (urlString: String) -> URLRequest {
        let url = URL(string: urlString)!
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.setValue(FVConst.URLMisc.kAccessToken, forHTTPHeaderField: "x-auth-token")
        
        return urlRequest as URLRequest
    }
    
    private class func complitionHandler (success: (JSON) -> Void, failure: (Int) -> Void, data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            //вызываем фэйлор блок от эррора
            failure((error! as NSError).code)
        } else if data != nil {
            let jsonResponse = JSON(data)
            //print(jsonResponse)
            success(jsonResponse)
        } else {
            failure(-3)
        }
    }
    
    class func getProfiles (success: @escaping (JSON) -> Void, failure: @escaping (Int) -> Void) {
        let urlString = FVConst.URLEndpoints.kBaseURL + FVConst.URLEndpoints.kProfiles + "?=fast_match=1&locale=ru"
        let request = makeRequest(urlString: urlString)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            complitionHandler(success: success, failure: failure, data: data, response: response, error: error)
        })
        task.resume()
    }
    
    class func passLike (id: String) {
        let urlString = FVConst.URLEndpoints.kBaseURL + FVConst.URLEndpoints.kLike + "\(id)?locale=ru"
        let request = makeRequest(urlString: urlString)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            if data != nil {
                let data = JSON(data)
                print (data)
            }
        })
        task.resume()
    }
    
    class func passDislike (id: String) {
        let urlString = FVConst.URLEndpoints.kBaseURL + FVConst.URLEndpoints.kDislike + "\(id)?locale=ru"
        let request = makeRequest(urlString: urlString)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            
            if data != nil {
                let data = JSON(data)
                print (data)
            }
        })
        task.resume()
    }
}
