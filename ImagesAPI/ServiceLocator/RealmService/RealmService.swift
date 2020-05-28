//
//  RealmService.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 26.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService: RealmServiceProtocol {
    let realm = try! Realm()
    
    func getImages(completion: @escaping ([ImageModel]) -> Void)  {
        let results = realm.objects(ImageModel.self)
        completion(Array(results))
    }
    
    func saveImage(image: ImageModel, completion: @escaping (Bool) -> Void) {
        try! self.realm.write {
            self.realm.add(image)
            completion(true)
        }
    }
    
    func removeImage(image: ImageModel, completion: @escaping (Bool) -> Void) {
        try! self.realm.write {
            self.realm.delete(image)
            completion(true)
        }
    }
}
