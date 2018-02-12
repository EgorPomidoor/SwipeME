//
//  FVGirl.swift
//  Fevroniya
//
//  Created by Егор on 03.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import Foundation

class FVGirl {
    var id: String
    var name: String
    var age: Int
    var education: String
    var workInfo: String
    var photos: NSArray
    var distance: Int
    
    init (id: String, name: String, age: Int, education: String, workInfo: String, photos: NSArray, distance: Int) {
        self.id = id
        self.name = name
        self.age = age
        self.education = education
        self.workInfo = workInfo
        self.photos = photos
        self.distance = distance
    }
    
}
