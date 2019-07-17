//
//  ProjectsViewController.swift
//  ARI
//
//  Created by Maxim Spiridonov on 11/06/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, StoryboardInitializable {

    var viewModel: ProjectsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        view.addSubview(viewModel.projectCollectionView)
        viewModel.projectCollectionView.fillSuperview()
    }
    
    // MARK: settings Navigation bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
