//
//  SearchProtocols.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 27.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

protocol SearchPresenter: AnyObject {
    func searchForText(text: String)
    func saveImageModel(image: ImageModel)
}

protocol SearchView: AnyObject {
    func setUrls(urls: [String], searchText: String)
}

protocol SearchRouter {}
