//
//  ProjectsCoordinator.swift
//  ARI
//
//  Created by Maxim Spiridonov on 11/06/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift

class ProjectsCoordinator: NavigationCoordinator {
    
    var criptoCoordinator: CriptoCoordinator?
    
    override init(_ navigationController: UINavigationController?) {
        super.init(navigationController)
    }
    override func start() -> Observable<Void> {
        
        let viewModel = ProjectsViewModel()
        let viewController = ProjectsViewController.initFromStoryboard(name: "Main")
        viewController.viewModel = viewModel
        viewModel.projectCollectionView.projectsDelegate = self
        
        self.rootViewController = viewController
        navigationController?.pushViewController(rootViewController!, animated: true)
        return Observable.never()
    }

}


//MARK: ProjectsCollectionViewDelegate
extension ProjectsCoordinator: ProjectsCollectionViewDelegate {
    func didSelectItemAt(viewModel: ReadySolutionViewModel) {
        criptoCoordinator = CriptoCoordinator(self.navigationController, viewModel)
        criptoCoordinator?.start()
    }
    
    func openMoreRecomendation() {
        print(#function)
    }
}
