//
//  ServiceLocator.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 26.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

protocol ServiceLocator {
    var realmService: RealmService { get }
    
    var mainService: MainServiceImpl { get }
    var searchService: SearchServiceImpl { get }
}
