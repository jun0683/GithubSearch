//
//  Network.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/13.
//

import Foundation

final class Network {
    static let shared = Network()
    
    func requestModel<T: Codable>(urlString: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(NSError.Network.networkUrlError))
        }
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {
                return completion(.failure(NSError.Network.networkDataError))
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    func requestData(urlString: String, completion: @escaping ((Result<Data, Error>) -> Void)) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(NSError.Network.networkUrlError))
        }
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {
                return completion(.failure(NSError.Network.networkDataError))
            }
            
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(data))
            }
        }
        dataTask.resume()
    }
}

extension NSError {
    enum Network {
        static var networkUrlError = NSError(domain: "network",
                                             code: -1,
                                             userInfo: [NSLocalizedDescriptionKey: "url error"])
        static var networkDataError = NSError(domain: "network",
                                              code: -2,
                                              userInfo: [NSLocalizedDescriptionKey: "data nil"])
    }
}
    
