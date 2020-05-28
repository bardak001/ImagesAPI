//
//  MainRouter.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 26.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Router
final class MainRouterImpl: MainRouter {

    weak var viewController: UIViewController?
    
    private let serviceLocator: ServiceLocator
    
    // MARK: - Output
    weak var moduleOutput: MainModuleOutput?
    
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
    }
}

//MARK: - Functions
extension MainRouterImpl {
    func navToSearchModule() {
        let vc =  SearchAssembler.createModule(serviceLocator: serviceLocator, moduleOutput: moduleOutput)
        let navController = UINavigationController(rootViewController: vc)
        viewController?.present(navController,
                                animated: true,
                                completion: nil)
//        viewController?.navigationController?.pushViewController(vc,
//                                                                 animated: true)
    }
}
