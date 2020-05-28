//
//  MainProtocols.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 26.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

protocol MainPresenter: AnyObject {
    func getImageModels()
    func removeImageModel(image: ImageModel, completion: @escaping (Bool) -> Void)
    func addTapped()
}

protocol MainView: AnyObject {
    func setImageModels(images: [ImageModel])
    func addImageModel(image: ImageModel)
}

protocol MainRouter {
    func navToSearchModule()
}

protocol MainModuleOutput: AnyObject {
    func addImage(image: ImageModel)
}
