//
//  ViewController.swift
//  PhotoFileManager
//
//  Created by Michael Khavin on 03.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var picturesManager = PicturesManager()
    
    override func loadView() {
        let mainView = MainView()
        mainView.photosTableView.dataSource = self
        mainView.photosTableView.delegate = self
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        picturesManager.pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainView.tableCellIdentifier, for: indexPath)
        
        if #available(iOS 14, *) {
            var config = cell.defaultContentConfiguration()
            config.text = picturesManager.pictures[indexPath.row]
            config.textProperties.font = .systemFont(ofSize: 20)
            cell.contentConfiguration = config
        } else {
            cell.textLabel?.text = picturesManager.pictures[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 20)
        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailView = DetailViewController()
        detailView.imagePath = picturesManager.pictures[indexPath.row]
        detailView.imageCount = picturesManager.pictures.count
        detailView.imageNumber = indexPath.row + 1
        
        navigationController?.pushViewController(detailView, animated: true)
    }
}
