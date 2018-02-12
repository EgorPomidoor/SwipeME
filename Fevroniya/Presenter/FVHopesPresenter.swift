//
//  Presenter.swift
//  Fevroniya
//
//  Created by Егор on 12.01.2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation
class FVHopesPresenter: NSObject {
    
    weak var viewInput: ViewInput?
    var dataSource = NSMutableArray()
    
    func getData () {
        DataLayer.getGirlsToChat(success: { (data) in
            DispatchQueue.main.async {
                self.dataSource = data as! NSMutableArray
                self.viewInput?.reloadData()
            }
        }, failure: {error in
            
        })
    }
}


//MARK:- протокол PresenterInput
extension FVHopesPresenter: PresenterInput {
    
    func viewLoaded(view: ViewInput) {
        viewInput = view
        getData()
    }
    
    func updateView() {
        DataLayer.getGirlsToChat(success: { (data) in
            self.dataSource.addObjects(from: data as! [Any])
        }, failure: {error in
            
        })
    }
}


//MARK:- протокол PresenterOutput
extension FVHopesPresenter: PresenterOutput {
    
    func numberOfEntities() -> Int {
        return dataSource.count
    }
    
    func entityAt(indexPath: Int) -> Any? {
        if dataSource.count - 1 < indexPath {
            return nil
        } else {
            return dataSource[indexPath]
        }
    }
    
    func passLike(index: Int) {
        let girl = dataSource[index] as! FVGirl
        DataLayer.passLike(id: girl.id)
    }
    
    func passDislike(index: Int) {
        let girl = dataSource[index] as! FVGirl
        DataLayer.passDislike(id: girl.id)
    }
}
