//
//  HomeViewModel.swift
//  ARI
//
//  Created by Maxim Spiridonov on 25/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import RxSwift

class HomeViewModel {
    static let iconName: String = "newspaper_1"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.13, green: 0.13, blue: 0.16, alpha: 1)
        label.font = UIFont(name: "TTNorms-Bold", size: 26)
        return label
    }()
    
    
    let readyCollectionView = ReadySolutionCollectionView()
    init() {
    }
}
