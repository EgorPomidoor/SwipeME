//
//  DependencyInjector.swift
//  Fevroniya
//
//  Created by Егор on 14.01.2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

class DependencyInjector {
    
    class func assignPresenter (view: ViewInput) {
        if view is FVHopesViewController {
            let presenter = FVHopesPresenter()
            view.assign(presenterInput: presenter, presenterOutput: presenter)
        }
    }
}
