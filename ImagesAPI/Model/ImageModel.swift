//
//  ImageModel.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 27.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation
import RealmSwift

class ImageModel: Object {
    
    @objc dynamic var imageURL = ""
    @objc dynamic var searchText = ""
    @objc dynamic var imageData: Data?
    @objc dynamic var date = Date()
    
    convenience init(imageURL: String, searchText: String, image: UIImage?, date: Date) {
        self.init()
        self.imageURL = imageURL
        self.searchText = searchText
        self.imageData = image?.jpegData(compressionQuality: 1)
        self.date = date
    }
}
