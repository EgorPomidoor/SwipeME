//
//  FVGirlCellView.swift
//  Fevroniya
//
//  Created by Егор on 08.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import UIKit
import SDWebImage

class FVGirlCellView: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configureSelf ( imageUrl: String) {
        photoImageView.sd_setImage(with: URL(string: imageUrl))
    }
}
