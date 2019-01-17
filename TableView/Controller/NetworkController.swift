//
//  NetworkController.swift
//  TableView
//
//  Created by Peter Kamb on 1/16/19.
//  Copyright © 2019 Peter Kamb. All rights reserved.
//

import Foundation

class NetworkController: NSObject, URLSessionDelegate {
    
    static let `default` = NetworkController()
    
    lazy var session: URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
    }()
    
    func getRemoteContent<T>(urlString: String, type: T.Type, completion: @escaping (T?) -> ()) where T : Decodable {
        guard let url = URL(string: urlString) else { completion(nil); return }
        getRemoteContent(url: url, type: type, completion: completion)
    }
    
    func getRemoteContent<T>(url: URL, type: T.Type, completion: @escaping (T?) -> ()) where T : Decodable {
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data, let items = try? JSONDecoder().decode(T.self, from: data) else {
                completion(nil)
                return
            }
            completion(items)
        }
        task.resume()
    }
    
}
