//
//  Model.swift
//  TableView
//
//  Created by Peter Kamb on 1/16/19.
//  Copyright © 2019 Peter Kamb. All rights reserved.
//

import UIKit

struct LoremPicsum {
    
    struct Photo: Codable {
        let id: Int
        
        let author: String
        let author_url: String
        
        let filename: String
        let post_url: String
        
        let format: String
        let width: Int
        let height: Int
    }
    
}

extension LoremPicsum {
    
    struct Networking {
        
        enum URLs: String {
            case getPhotos = "https://picsum.photos/list"
        }
        
        func getPhotos(completion: @escaping ([Photo]?) -> ()) {
            guard let url = URL(string: URLs.getPhotos.rawValue) else { return }
            
            let task = NetworkController.default.session.dataTask(with: url) { (data, response, error) in
                guard let data = data else { completion(nil); return }
                
                let items = try? JSONDecoder().decode([Photo].self, from: data)
                completion(items)
            }
            task.resume()
        }
    }
    
}
