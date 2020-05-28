//
//  RealmServiceProtocol.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 26.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    var realm: Realm { get }
    
    func getImages(completion: @escaping ([ImageModel]) -> Void)
    func saveImage(image: ImageModel, completion: @escaping (Bool) -> Void)
    func removeImage(image: ImageModel, completion: @escaping (Bool) -> Void)
}

