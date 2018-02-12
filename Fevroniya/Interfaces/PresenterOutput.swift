//
//  PresenterOutput.swift
//  Fevroniya
//
//  Created by Егор on 12.01.2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

protocol PresenterOutput: class {
    func numberOfEntities () -> Int
    func entityAt (indexPath: Int) -> Any?
    func passLike (index: Int)
    func passDislike (index: Int)
}
