//
//  Array+Extension.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//

import Foundation

extension Array {   
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
