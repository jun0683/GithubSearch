//
//  GitHubRepositoriesRouter.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol GitHubRepositoriesRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol GitHubRepositoriesDataPassing {
    var dataStore: GitHubRepositoriesDataStore? { get set }
}

class GitHubRepositoriesRouter: NSObject, GitHubRepositoriesRoutingLogic, GitHubRepositoriesDataPassing {
    weak var viewController: GitHubRepositoriesViewController?
    var dataStore: GitHubRepositoriesDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: GitHubRepositoriesViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: GitHubRepositoriesDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
