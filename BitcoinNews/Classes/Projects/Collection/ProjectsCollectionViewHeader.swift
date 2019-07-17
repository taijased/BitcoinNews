//
//  ProjectsCollectionViewHeader.swift
//  ARI
//
//  Created by Maxim Spiridonov on 11/06/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class ProjectsCollectionViewHeader: UICollectionReusableView {
    
    static let reuseId = "ProjectsCollectionViewHeader"
    
    
    let recomendationView: WebImageView = {
        let view = WebImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.set(imageURL: "https://prostocoin.com/assets/images/what-is-cryptocurrency.jpg")
        return view
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addRecomendationView()
    }
    
    fileprivate func addRecomendationView() {
        
        addSubview(recomendationView)
        recomendationView.fillSuperview()
        
        // TODO: нужно будет исправить такая хуйня это подгон
        // get frame label
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
