//
//  FVHopesViewController.swift
//  Fevroniya
//
//  Created by Егор on 03.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import UIKit
import SDWebImage

class FVHopesViewController: UIViewController {
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var containerView: SwipableViews!
    let kCardNib = UINib(nibName: "FVGirlView", bundle: nil)
    var presenterInput: PresenterInput?
    var presenterOutput: PresenterOutput?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.layer.cornerRadius = 20
        blurView.layer.masksToBounds = true
        blurView.layer.borderWidth = 2
        
        containerView.registerNib(nib: kCardNib)
        
        DependencyInjector.assignPresenter(view: self)
        
        containerView.dataSource = self
        containerView.delegate = self
    }
    
    
    @IBAction func dislikeButton() {
        //добавить запрос на дизлайк
        containerView.autoSwipe(direction: .left)
    }
    
    @IBAction func likeButton() {
        //добавить запрос на лайк
        containerView.autoSwipe(direction: .right)
    }
}


//MARK:- протокол ViewInput
extension FVHopesViewController: ViewInput {
    
    func assign(presenterInput: PresenterInput, presenterOutput: PresenterOutput) {
        self.presenterInput = presenterInput
        self.presenterOutput = presenterOutput
        
        presenterInput.viewLoaded(view: self)
    }
    
    func reloadData() {
        containerView.reloadData()
    }
    
}


//MARK:- протокол SwipableViewsDataSource & SwipableViewsDelegate
extension FVHopesViewController: SwipableViewsDataSource, SwipableViewsDelegate {
    
    func view ( view : UIView , atIndex index : Int ) {
        let view = view as! FVGirlView
        let model = presenterOutput?.entityAt(indexPath: index)
        view.configureSelf(model: model as! FVGirl)
    }
    
    func numberOfViews () -> Int {
        return presenterOutput != nil ? presenterOutput!.numberOfEntities() : 0
    }
    
    func willSwiped(direction: swipeDirection, index: Int) {
        if direction == .left {
            presenterOutput?.passDislike(index: index)
        } else {
            presenterOutput?.passLike(index: index)
        }
        if index == ((presenterOutput?.numberOfEntities())! - 1) - 6 {
            presenterInput?.updateView()
        }
        containerView.reloadData()
    }
    
    
    func imageAlpha(of view: UIView, dif: CGFloat, center: CGFloat) {
        let view = view as! FVGirlView
        
        if dif > 0 {
            view.ratingImageView.image = #imageLiteral(resourceName: "like")
        } else if dif < 0{
            view.ratingImageView.image = #imageLiteral(resourceName: "dislike")
            //FVView.ratingImageView.tintColor = UIColor.red
        }
        
        view.ratingImageView.alpha = fabs(dif) / center
    }
    
    func setAlphaToZero(of view: UIView ) {
        let view = view as! FVGirlView
        view.ratingImageView.alpha = 0
    }
}


