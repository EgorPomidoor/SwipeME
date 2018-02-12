//
//  DataLayer.swift
//  Fevroniya
//
//  Created by Егор on 10.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import Foundation

class DataLayer {
    class func getGirlsToChat (success: @escaping (NSArray) -> Void, failure: @escaping (Int) -> Void) {
        API_WRAPPER.getProfiles(success: {(response) in
            
            let outArray = NSMutableArray ()
            let girlsArray = response["results"].arrayValue
            
            for girl in girlsArray {
                let girlModel = FVGirlFabric.getFromJSON(json: girl)
                outArray.add(girlModel)
            }
            
            //-------------------------------//
            
            success(outArray)
            
        }, failure: failure)
    }
    
    class func passLike (id: String){
        API_WRAPPER.passLike(id: id)
    }
    
    class func passDislike (id: String) {
        API_WRAPPER .passDislike(id: id)
    }
}
