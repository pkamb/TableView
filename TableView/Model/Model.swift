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
    
    enum Endpoints: String {
        case getPhotos = "https://picsum.photos/list"
    }
    
    static func getPhotos(completion: @escaping ([Photo]?) -> ()) {
        NetworkController.default.getRemoteContent(urlString: Endpoints.getPhotos.rawValue, type: [Photo].self, completion: completion)
    }
    
}
