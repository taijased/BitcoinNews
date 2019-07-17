//
//  WalkthroughCoordinator.swift
//  BitcoinNews
//
//  Created by Maxim Spiridonov on 16/07/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift



protocol WalkthroughCoordinatorDelegate: class {
    func dismisWalkthrough()
}

class WalkthroughCoordinator: AppCoordinator {
    
    public var walkthroughController: WalkthroughViewController
    weak var delegate: WalkthroughCoordinatorDelegate?
    
    override init(window: UIWindow) {
        
        let viewModel = WalkthroughViewModel()
        walkthroughController = WalkthroughViewController.initFromStoryboard(name: "Main")
        walkthroughController.viewModel = viewModel
       
        super.init(window: window)
        walkthroughController.delegate = self
        
    }
    override func start() -> Observable<Void> {
        
        window.rootViewController = walkthroughController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
//    
//    override init(_ navigationController: UINavigationController?) {
//        super.init(navigationController)
//    }
//    override func start() -> Observable<Void> {
//
//        let viewModel = WalkthroughViewModel()
//        let viewController = WalkthroughViewController.initFromStoryboard(name: "Main")
//        viewController.viewModel = viewModel
//
//        self.rootViewController = viewController
//        navigationController?.pushViewController(rootViewController!, animated: true)
//        return Observable.never()
//    }
    
    
}


extension WalkthroughCoordinator: WalkthroughViewControllerDelegate {
    func finishWalkthrough() {
        delegate?.dismisWalkthrough()
    }
}
