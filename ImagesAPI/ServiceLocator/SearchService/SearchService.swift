//
//  SearchService.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 27.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation

//MARK: - Service
class SearchServiceImpl {
    
    private var realmService: RealmService
    private var requestManager: RequestManager
    
    init(realmService: RealmService,
         requestManager: RequestManager) {
        self.realmService = realmService
        self.requestManager = requestManager
    }
    
}

extension SearchServiceImpl {
    func searchForText(text: String, completion: @escaping ([String]) -> Void) {
        let parameters: [String : String] = [
            "q": text,
            "count":"100",
            "offset": "0",
            "mkt": "en-us",
            "safeSearch": "Moderate"
        ]
        let headerParameters: [String : String] = [
            "Ocp-Apim-Subscription-Key": "f7aafb39cab244649a57eba63068943f"
        ]
        RequestManager.sendRequest(url: "https://api.cognitive.microsoft.com/bing/v7.0/images/search",
                                   parameters: parameters,
                                   headerParameters: headerParameters) { responseObject, error in
            guard let responseObject = responseObject,
                error == nil, let dict = responseObject["value"] as? [[String: Any]]  else {
                return
            }
            var urls = [String]()
            for d in dict {
                if let contentUrl = d["contentUrl"] as? String {
                    urls.append(contentUrl)
                }
            }
            completion(urls)
        }
    }
}
