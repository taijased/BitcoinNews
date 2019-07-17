//
//  WalkthroughViewModel.swift
//  BitcoinNews
//
//  Created by Maxim Spiridonov on 16/07/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


import UIKit
import paper_onboarding

class WalkthroughViewModel {
    //MARK: Constants
    
    static let titleFont = UIFont(name: "TTNorms-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    static let descriptionFont = UIFont(name: "TTNorms-Bold", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)


    let items = [
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
    
    init() {
        
    }
}
