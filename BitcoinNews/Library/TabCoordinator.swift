//
//  TabCoordinator.swift
//  ARI
//
//  Created by Maxim Spiridonov on 25/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit
import RxSwift

import UIKit

final class MainTabBarController: UITabBarController, StoryboardInitializable { }

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}


class TabCoordinator: AppCoordinator {
    
    
    
    let tabController: UITabBarController
    let homeCoordinator: HomeCoordinator
    let projectsCoordinator: ProjectsCoordinator
//    let converterCoordinator: ConverterCoordinator
    
    
    
    override init(window: UIWindow){
        
        tabController = MainTabBarController.initFromStoryboard(name: "Main")
        
        
        homeCoordinator = HomeCoordinator(tabController.navigationController)
        homeCoordinator.start()
        projectsCoordinator = ProjectsCoordinator(tabController.navigationController)
        projectsCoordinator.start()
//
//        converterCoordinator = ConverterCoordinator(tabController.navigationController)
//        converterCoordinator.start()
        
        super.init(window: window)
        setupControllers()
        
    }
    private func setupControllers() {
        var controllers: [UIViewController] = []
        
        
        let homeViewController = homeCoordinator.rootViewController!
        let projectsViewController = projectsCoordinator.rootViewController!
//        let converterViewController = converterCoordinator.rootViewController!
        
        setTabProperty(viewController: homeViewController, defaultImage: UIImage(named: HomeViewModel.iconName)!)
        setTabProperty(viewController: projectsViewController, defaultImage: UIImage(named: ProjectsViewModel.iconName)!)
//        setTabProperty(viewController: converterViewController, defaultImage: UIImage(named: ConverterViewModel.iconName)!)
        
        controllers.append(homeViewController.navigationController!)
//        controllers.append(converterViewController.navigationController!)
        controllers.append(projectsViewController.navigationController!)
       
        
        tabController.viewControllers = controllers
        
        
        tabController.tabBar.isTranslucent = false
        tabController.tabBar.barTintColor = UIColor(hexValue: "#EB5777", alpha: 1)
        tabController.tabBar.tintColor = UIColor.white
        tabController.tabBar.layer.shadowColor = UIColor.black.cgColor
        tabController.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tabController.tabBar.layer.shadowRadius = 5
        tabController.tabBar.layer.shadowOpacity = 0.25
        tabController.tabBar.layer.masksToBounds = false
        
    }
    
    
    
    private func setTabProperty(viewController: UIViewController, defaultImage: UIImage) {
        let tabBarItem = UITabBarItem(title: "", image: defaultImage, selectedImage: defaultImage)
        viewController.tabBarItem = tabBarItem
    }
    
    
    override func start() -> Observable<Void> {
        
        self.rootViewController = tabController
        
        window.rootViewController = tabController
        window.makeKeyAndVisible()
        return Observable.never()
    }
    
}

