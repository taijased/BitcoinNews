//
//  HomeCoordinator.swift
//  ARI
//
//  Created by Maxim Spiridonov on 25/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import RxSwift


class HomeCoordinator: NavigationCoordinator {
    
    var criptoCoordinator: CriptoCoordinator?
    
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = HomeViewModel()
        
        let viewController = HomeViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        
        viewModel.readyCollectionView.solutionDelegate = self
       
        
        self.rootViewController = viewController
        navigationController?.pushViewController(rootViewController!, animated: true)
        return Observable.never()
    }
    private func showSolutionScreen(_ cellViewModel: ReadySolutionViewModel) {
        criptoCoordinator = CriptoCoordinator(self.navigationController, cellViewModel)
        criptoCoordinator?.start()
    }
}


extension HomeCoordinator: ReadySolutionCollectionViewDelegate {
    func didSelectItemAt(cellViewModel: ReadySolutionViewModel) {
        showSolutionScreen(cellViewModel)
    }
}
