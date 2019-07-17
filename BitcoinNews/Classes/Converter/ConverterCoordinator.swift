//
//  ProjectsCoordinator.swift
//  ARI
//
//  Created by Maxim Spiridonov on 11/06/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift

class ConverterCoordinator: NavigationCoordinator {
    
    
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = ConverterViewModel()
        let viewController = ConverterViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        
        self.rootViewController = viewController
        navigationController?.pushViewController(rootViewController!, animated: true)
        return Observable.never()
    }
}

