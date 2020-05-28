//
//  MainService.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 27.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation

//MARK: - Service
class MainServiceImpl {
    
    private var realmService: RealmService
    private var requestManager: RequestManager
    
    init(realmService: RealmService,
         requestManager: RequestManager) {
        self.realmService = realmService
        self.requestManager = requestManager
    }
    
}

extension MainServiceImpl {}
