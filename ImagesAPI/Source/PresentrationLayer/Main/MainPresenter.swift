//
//  MainPresenter.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 26.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Presenter
class MainPresenterImpl: MainPresenter {
    
    let view: MainView
    let router: MainRouter
    let state: MainState
    
    // MARK: - Service
    var realmService: RealmService
    var mainService: MainServiceImpl
    
    // MARK: - Init
    init(view: MainView,
         router: MainRouter,
         state: MainState,
         realmService: RealmService,
         mainService: MainServiceImpl) {
        self.view = view
        self.router = router
        self.state = state
        self.realmService = realmService
        self.mainService = mainService
    }
}

//MARK: - Functions
extension MainPresenterImpl {
    func getImageModels() {
        realmService.getImages { images in
            self.view.setImageModels(images:images)
        }
    }
    func removeImageModel(image: ImageModel, completion: @escaping (Bool) -> Void) {
        realmService.removeImage(image: image) { success in
            completion(success)
        }
    }
    func addTapped() {
        router.navToSearchModule()
    }
}
extension MainPresenterImpl: MainModuleOutput {
    func addImage(image: ImageModel) {
        view.addImageModel(image: image)
    }
    
}

