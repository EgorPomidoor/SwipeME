//
//  FVGirlView.swift
//  Fevroniya
//
//  Created by Егор on 03.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import UIKit


//MARK:- интерфейс
class FVGirlView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    
    let kPhotoNIB = UINib(nibName: "FVGirlCellView", bundle: nil)
    let kPhotoCellReuseIdentifier = "kPhotoCellReuseIdentifier"
    
    var dataSource = NSArray ()
    
    override func awakeFromNib() {
        collectionView.register(kPhotoNIB, forCellWithReuseIdentifier: kPhotoCellReuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        super.awakeFromNib()
    }
    
    
    func configureSelf(model: FVGirl) {
        
        dataSource = model.photos
        nameLabel.text = model.name + ", " + String(model.age)
        educationLabel.text = model.education
        workLabel.text = model.workInfo
        distanceLabel.text = "В " + String(model.distance) + " км. от вас"
        
        collectionView.reloadData()
    }
    
    
    @IBAction func nextPhotoButton() {
        let indexPathArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentIndexPath = indexPathArray.object(at: 0) as! IndexPath
        print(currentIndexPath)
        let nextIndexPath = IndexPath(item: currentIndexPath.item + 1, section: 0)
        if nextIndexPath.row < dataSource.count {
            collectionView.scrollToItem(at: nextIndexPath, at: .right, animated: true)
        }
    }
    
    
    @IBAction func previousPhotoButton() {
        let indexPathArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentIndexPath = indexPathArray.object(at: 0) as! IndexPath
        print(currentIndexPath)
        var previousIndexPath = IndexPath(item: currentIndexPath.item - 1, section: 0)
//        if currentIndexPath.item == 0 {
//            return
//        } else if previousIndexPath.row < dataSource.count {
//            collectionView.scrollToItem(at: previousIndexPath, at: .left, animated: true)
//        }
        if previousIndexPath.row >= 0 {
            collectionView.scrollToItem(at: previousIndexPath, at: .left, animated: true)
        }
    }
}

//MARK:- процедуры UICOllectionViewDelegate, UICollectionViewDataSource
extension FVGirlView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellReuseIdentifier, for: indexPath) as! FVGirlCellView
        cell.configureSelf(imageUrl: dataSource[indexPath.item] as! String)
        return cell
    }
}
