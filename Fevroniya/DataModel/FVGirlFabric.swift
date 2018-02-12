//
//  FVGirlFabric.swift
//  Fevroniya
//
//  Created by Егор on 03.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import Foundation
import SwiftyJSON

class FVGirlFabric {
    class func getFromJSON (json: JSON) -> FVGirl {
        let id = json["_id"].stringValue
        let name = json["name"].stringValue
        
        //считаем возраст
        let ageRaw = json["birth_date"].stringValue
        let birthDay = "\(ageRaw.prefix(10))"
        func calcAge (birtday: String) -> Int {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"
            let birthDayDate = dateFormater.date(from: birtday)
            let calendar = NSCalendar(identifier: .gregorian)
            let now = Date()
            let calcAge = calendar?.components(.year, from: birthDayDate!, to: now)
            let age = calcAge?.year
            return age!
        }
        
        
        
        let distance = lround((json["distance_mi"].doubleValue) * 1.6)
       
        
        let photos = NSMutableArray()
        for object in json["photos"].arrayValue {
            let Url = object["url"].stringValue
            photos.add(Url)
        }
        
        var workInfo = ""
        var education = ""
        let teasersArray = json["teasers"].arrayValue
        if teasersArray.count != 0 {
            for teaser in teasersArray {
                let type = teaser["type"]
                if type == "job" || type == "position" || type == "jobPosition" {
                     workInfo = teaser["string"].stringValue
                } else if type == "school" {
                     education = teaser["string"].stringValue
                }
            }
        }
        
        return FVGirl(id: id, name: name, age: calcAge(birtday: birthDay), education: education, workInfo: workInfo, photos: photos, distance: distance)
    }
}



