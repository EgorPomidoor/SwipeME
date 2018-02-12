//
//  PresenterInput.swift
//  Fevroniya
//
//  Created by Егор on 12.01.2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

protocol PresenterInput: class {
    func viewLoaded (view: ViewInput)
    func updateView ()
}


