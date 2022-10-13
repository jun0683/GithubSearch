//
//  ViewController.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    private let testImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }

    private func setupViews() {
        subviews.forEach({
            view.addSubview($0)
        })
        
        NSLayoutConstraint.activate(viewConstraints)
        
        ImageLoader.shared.setImage(imageUrl: "https://www.gravatar.com/avatar/51088c3522d654d72ac71eddc74b28c0?s=64&d=identicon&r=PG", imageView: testImageView)
        
        Network.shared.requestModel(urlString: "https://api.github.com/search/repositories?q=test") { (result: Result<GithubRepositories, Error>) in
            print(result)
        }
    }

}


// MARK: - Layout & Constraints
private extension ViewController {
    
    var subviews: [UIView] {
        return [
            testImageView
        ]
    }
    
    var viewConstraints: [NSLayoutConstraint] {
        return [
            testImageConstraints
        ].flatMap { $0 }
    }
    
    var testImageConstraints: [NSLayoutConstraint] {
        [testImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         testImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)]
    }
}
