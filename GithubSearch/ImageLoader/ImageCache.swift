//
//  ImageCache.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/16.
//

import UIKit

final class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}
