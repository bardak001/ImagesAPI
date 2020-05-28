//
//  SearchViewController.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 27.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - ViewController
class SearchViewController: UIViewController {
    
    var presenter: SearchPresenter?
    
    private let searchController = UISearchController()
    private var lastSearch = ""
    
    private var urls = [String]()
    private var currentUrlIndex: Int?
        
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 100,
                                 width: view.bounds.width,
                                 height: view.bounds.height - 100)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "поменять картинку",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(refreshAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "добавить",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(saveAction))
    }
    
    @objc private func saveAction() {
        guard let index = currentUrlIndex,
            index < urls.count else { return }
        let image = ImageModel(imageURL: urls[index],
                               searchText: lastSearch,
                               image: imageView.image,
                               date: Date())
        presenter?.saveImageModel(image: image)
    }
    
    @objc private func refreshAction() {
        setImageRandomIndex()
    }
    
    func setImageRandomIndex() {
        guard urls.count != 0 else { return }
        currentUrlIndex = Int.random(in: 0..<urls.count)
        guard let index = currentUrlIndex,
            let url = URL(string: urls[index]) else { return }
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: url)
            self.title = "\(index)/\(self.urls.count)"
        }
        
    }
}

//MARK: - View
extension SearchViewController: SearchView {
    func setUrls(urls: [String], searchText: String) {
        guard lastSearch == searchText else { return }
        self.urls = urls
        setImageRandomIndex()
    }
}

extension SearchViewController: UISearchResultsUpdating {
    // MARK: Results Updating
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, searchText != "",
            searchText != lastSearch else { return }
        lastSearch = searchText
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presenter?.searchForText(text: searchText)
        }
    }
}
