//
//  ViewInput.swift
//  Fevroniya
//
//  Created by Егор on 12.01.2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

protocol ViewInput: class {
    func reloadData ()
    func assign (presenterInput: PresenterInput, presenterOutput: PresenterOutput)
}
