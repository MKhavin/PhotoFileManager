//
//  DetailViewController.swift
//  PhotoFileManager
//
//  Created by Michael Khavin on 04.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    var imagePath: String?
    
    override func loadView() {
        let rootView = DetailView()
        rootView.pictureImageView.image = UIImage(named: imagePath ?? "")
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = imagePath
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
}
