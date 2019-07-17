//
//  ReadySolutionCollectionViewCell.swift
//  ARI
//
//  Created by Maxim Spiridonov on 25/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit

class ReadySolutionCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "ReadySolutionCollectionViewCell"
    var gradientLayer: CAGradientLayer?
    
    let myImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.8882605433, green: 0.8981810212, blue: 0.9109882712, alpha: 1)
        return imageView
    }()
    
    let viewLabelMask: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "TTNorms-Bold", size: 22)
        label.numberOfLines = 4
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    
    
    func set(viewModel: ReadySolutionViewModel) {
        myImageView.set(imageURL: viewModel.iconUrlString)
        label.text = viewModel.name
    }
    
    private func setupLayers() {
        // first layer
        addSubview(myImageView)
        // myImageView constraints
        myImageView.fillSuperview()
        
        // second layer
        myImageView.addSubview(viewLabelMask)
        viewLabelMask.bottomAnchor.constraint(equalTo: myImageView.bottomAnchor).isActive = true
        viewLabelMask.leadingAnchor.constraint(equalTo: myImageView.leadingAnchor).isActive = true
        viewLabelMask.trailingAnchor.constraint(equalTo: myImageView.trailingAnchor).isActive = true
        viewLabelMask.heightAnchor.constraint(equalToConstant: 42).isActive = true
        // thrid layer
        
        // add gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
                                UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor]
        
        gradientLayer.locations = [0.0, 0.3]
        gradientLayer.frame = bounds
        viewLabelMask.layer.insertSublayer(gradientLayer, at: 0)
        
        viewLabelMask.addSubview(label)
        label.centerXAnchor.constraint(equalTo: viewLabelMask.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: viewLabelMask.centerYAnchor, constant: -25).isActive = true
        label.leadingAnchor.constraint(equalTo: viewLabelMask.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: viewLabelMask.trailingAnchor).isActive = true
        
    }
    
    
    override func prepareForReuse() {
        myImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 10
        layer.shadowRadius = 7
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
