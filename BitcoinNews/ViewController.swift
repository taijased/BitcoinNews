//
//  ViewController.swift
//  AnimatedPageView
//
//  Created by Alex K. on 12/04/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController {
    
    @IBOutlet var skipButton: UIButton!
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "newspaper"),
                           title: "Новости о Bitcoin",
                           description: "Это новое поколение децентрализованной цифровой валюты, созданной и работающей только в сети интернет",
                           pageIcon: #imageLiteral(resourceName: "Component"),
                           color: UIColor(hexValue: "#5F9EEB", alpha: 1)!,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "Component 2"),
                           title: "Курс Bitcoin",
                           description: "Курс Биткоина онлайн на сегодня. BTC онлайн, котировки, сколько стоит Bitcoin в долларах.",
                           pageIcon: #imageLiteral(resourceName: "Wallet"),
                           color: UIColor(hexValue: "#EB5777", alpha: 1)!,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "bitcoin_market"),
                           title: "Биржи",
                           description: "Содержащиеся данные в этом приложении предназначены для общих информационных целей и не являются приглашением или предложением о покупке каких-либо ценных бумаг.",
                           pageIcon: #imageLiteral(resourceName: "bitcoin"),
                           color: UIColor(hexValue: "#A0D37D", alpha: 1)!,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        ]
    
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
}


// MARK: PaperOnboardingDelegate

extension ViewController: PaperOnboardingDelegate {
    
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

extension ViewController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
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


//MARK: Constants
private extension ViewController {
    
    static let titleFont = UIFont(name: "TTNorms-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    static let descriptionFont = UIFont(name: "TTNorms-Bold", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}

