//
//  WalkthroughViewController.swift
//  BitcoinNews
//
//  Created by Maxim Spiridonov on 16/07/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import UIKit


import UIKit
import paper_onboarding


protocol WalkthroughViewControllerDelegate: class {
    func finishWalkthrough()
}


class WalkthroughViewController: UIViewController, StoryboardInitializable {
    
    var viewModel:  WalkthroughViewModel!
    weak var delegate: WalkthroughViewControllerDelegate?
    
    @IBOutlet var skipButton: UIButton! {
        didSet {
             skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        }
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipButton.isHidden = true
        setupPaperOnboardingView()
        view.bringSubviewToFront(skipButton)
    }
    
    
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        


        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
    
    @objc func skipButtonTapped(_ sender: UIButton) {
        sender.flash()
        delegate?.finishWalkthrough()
        dismiss(animated: true, completion: nil)
    }
}


// MARK: PaperOnboardingDelegate

extension WalkthroughViewController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 2 ? false : true
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
        // configure item
        
        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}

// MARK: PaperOnboardingDataSource

extension WalkthroughViewController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return viewModel.items[index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    //        func onboardinPageItemRadius() -> CGFloat {
    //            return 2
    //        }
    
    func onboardingPageItemSelectedRadius() -> CGFloat {
        return 10
    }
    func onboardingPageItemColor(at index: Int) -> UIColor {
        return [UIColor(hexValue: "#5F9EEB", alpha: 1)!, UIColor(hexValue: "#EB5777", alpha: 1)!, UIColor(hexValue: "#A0D37D", alpha: 1)!][index]
    }
}




