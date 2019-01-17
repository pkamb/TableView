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
    
    func getRemoteContent<T>(url: URL, type: T.Type, completion: @escaping (T?) -> ()) where T : Decodable {
        
    }
    
}
