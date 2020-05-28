//
//  MainTableViewController.swift
//  ImagesAPI
//
//  Created by Радим Гасанов on 26.05.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit


//MARK: - ViewController
class MainTableViewController: UITableViewController {
    
    var presenter: MainPresenter?
    
    private let reuseID = "cell"
    
    private var images = [ImageModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addAction))
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: reuseID)
        
        presenter?.getImageModels()
    }
    
    @objc private func addAction() {
        presenter?.addTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.performBatchUpdates(nil,
                                      completion: nil)
    }
    
}
    // MARK: - Table view data source
extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.selectionStyle = .none
        let image = images[indexPath.row]
        cell.textLabel?.text = image.searchText
        if let imageData = image.imageData {
            cell.imageView?.image = UIImage(data: imageData)
        } else if let url = URL(string: image.imageURL) {
            cell.imageView?.kf.setImage(with: url)
        }
        return cell
    }
}

// MARK: - Table view delegate
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        presenter?.removeImageModel(image: image, completion: { success in
            guard success else { return }
            self.images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        })
    }
}

//MARK: - View
extension MainTableViewController: MainView {
    func setImageModels(images: [ImageModel]) {
        self.images = images
        tableView.reloadData()
    }
    
    func addImageModel(image: ImageModel) {
        self.images.append(image)
        tableView.reloadData()
    }
}
