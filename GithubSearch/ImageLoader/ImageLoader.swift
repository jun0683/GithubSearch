//
//  ImageLoader.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/13.
//

import UIKit

final class ImageLoader {
    static let shared = ImageLoader()
    
    func setImage(imageUrl: String, imageView: UIImageView) {
        getImage(imageUrl: imageUrl) { result in
            switch result {
            case .success(let image):
                imageView.image = image
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImage(imageUrl: String, completion: @escaping ((Result<UIImage, Error>) -> Void)) {
        Network.shared.requestData(urlString: imageUrl, completion: { (result) in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else {
                    return completion(.failure(NSError.ImageLoader.imageDataError))
                }
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

extension NSError {
    enum ImageLoader {
        static var imageDataError = NSError(domain: "imageloader",
                                             code: -1,
                                             userInfo: [NSLocalizedDescriptionKey: "image data error"])
    }
}

extension UIImageView {
    func setImage(imageUrl: String) {
        ImageLoader.shared.setImage(imageUrl: imageUrl, imageView: self)
    }
}
