//
//  GitHubRepositoriesRouter.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol GitHubRepositoriesRoutingLogic {
    func routeToSeaerchOption()
    func routeToSort()
    func routeToOrder()
}

protocol GitHubRepositoriesDataPassing {
    var dataStore: GitHubRepositoriesDataStore? { get set }
}

class GitHubRepositoriesRouter: NSObject, GitHubRepositoriesRoutingLogic, GitHubRepositoriesDataPassing {
    weak var viewController: GitHubRepositoriesViewController?
    var dataStore: GitHubRepositoriesDataStore?
    
    // MARK: Routing
    
    func routeToSeaerchOption() {
        let menuAlert = UIAlertController(title: "Search options", message: "", preferredStyle: .actionSheet)
        let sort = UIAlertAction(title: "sort", style: .default, handler: { [weak self] _ in
            self?.routeToSort()
        })
        let order = UIAlertAction(title: "Order", style: .default, handler: { [weak self] _ in
            self?.routeToOrder()
        })
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        menuAlert.addAction(sort)
        menuAlert.addAction(order)
        menuAlert.addAction(cancel)
        
        viewController?.present(menuAlert, animated: true, completion: nil)
    }
    
    func routeToSort() {
        let option = searchOptionViewController()
        
        viewController?.present(option, animated: true)
    }
    
    func routeToOrder() {
        let option = searchOptionViewController()
        
        viewController?.present(option, animated: true)
    }
    
    private func searchOptionViewController() -> UIViewController {
        let option = SearchOptionViewController()
        
        
        return UINavigationController(rootViewController: option)
    }
}
