//
//  HomeViewController.swift
//  ARI
//
//  Created by Maxim Spiridonov on 25/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, StoryboardInitializable {
    
    let disposeBag = DisposeBag()
    var viewModel: HomeViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReadySolutionView()
    }


    private func setupReadySolutionView() {
        view.addSubview(viewModel.readyCollectionView)
        viewModel.readyCollectionView.fillSuperview()
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
