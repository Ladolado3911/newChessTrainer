//
//  NetworkManager.swift
//  ChessTrainer2
//
//  Created by Guest User on 6/11/21.
//

import Foundation
import UIKit

enum Endpoint: String {
    case openigns = ""
    
    var url: URL? {
        return URL(string: self.rawValue)
    }
}

protocol NetworkManagerProtocol: AnyObject {
    func fetchData<T:Codable>(using endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
    
    
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private init() {}

    func fetchData<T:Codable>(using endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let newData = data {
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: newData)
                    completion(.success(decoded))
                }
                catch {
                    print("Could not decode")
                    print(error)
                    completion(.failure(error))
                }
            }
            else {
                print("Could not unwrap data")
            }
        }.resume()
    }
}
