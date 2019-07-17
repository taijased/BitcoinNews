//
//  HomeCoordinator.swift
//  ARI
//
//  Created by Maxim Spiridonov on 25/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import RxSwift


class CriptoCoordinator: NavigationCoordinator {
    
    let viewModel = CriptoViewModel()
    
    init(_ navigationController: UINavigationController?, _ cellViewModel: ReadySolutionViewModel) {
        viewModel.data = cellViewModel
        super.init(navigationController)
        
    }
    override func start() -> Observable<Void> {
        
        let viewController = CriptoViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        
        self.rootViewController = viewController
        navigationController?.present(viewController, animated: true)
        return Observable.never()
    }
    
}



