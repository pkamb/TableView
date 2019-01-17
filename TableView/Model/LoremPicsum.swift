//
//  LoremPicsum.swift
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
        
        func getImage(size: Int, completion: @escaping (UIImage?) -> ()) {
            let imageURL = LoremPicsum.Endpoints.getImage(self, size).url
            NetworkController.default.getImage(url: imageURL, completion: completion)
        }
    }
    
}

extension LoremPicsum {
    
    enum Endpoints {
        case getPhotos
        case getImage(Photo, Int)
        
        var url: URL {
            switch self {
            case .getPhotos: return URL(string:"https://picsum.photos/list")!
            case .getImage(let photo, let size): return URL(string:"https://picsum.photos/\(size)/?image=\(photo.id)")!
            }
        }
    }
    
    static func getPhotos(completion: @escaping ([Photo]?) -> ()) {
        NetworkController.default.getRemoteContent(url: Endpoints.getPhotos.url, type: [Photo].self, completion: completion)
    }
    
}
