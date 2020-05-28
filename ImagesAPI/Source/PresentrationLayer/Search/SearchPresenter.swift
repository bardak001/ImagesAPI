//
//  SearchPresenter.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 27.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Presenter
class SearchPresenterImpl: SearchPresenter {
    
    let view: SearchView
    let router: SearchRouter
    let state: SearchState
    
    // MARK: - Service
    var realmService: RealmService
    var searchService: SearchServiceImpl
    
    // MARK: - Output
    var moduleOutput: MainModuleOutput?
    
    // MARK: - Init
    init(view: SearchView,
         router: SearchRouter,
         state: SearchState,
         realmService: RealmService,
         searchService: SearchServiceImpl,
         moduleOutput: MainModuleOutput?) {
        self.view = view
        self.router = router
        self.state = state
        self.realmService = realmService
        self.searchService = searchService
        self.moduleOutput = moduleOutput
    }
}

//MARK: - Functions
extension SearchPresenterImpl {
    func searchForText(text: String) {
        searchService.searchForText(text: text) { urls in
            self.view.setUrls(urls: urls, searchText: text)
        }
    }
    func saveImageModel(image: ImageModel) {
        realmService.saveImage(image: image) { success in
            guard success else { return }
            self.moduleOutput?.addImage(image: image)
        }
    }
}
