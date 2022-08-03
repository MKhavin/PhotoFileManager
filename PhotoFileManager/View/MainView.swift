//
//  MainView.swift
//  PhotoFileManager
//
//  Created by Michael Khavin on 03.08.2022.
//

import UIKit

class MainView: UIView {
    static let tableCellIdentifier = "Picture"
    
    private(set) lazy var photosTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: MainView.tableCellIdentifier)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(photosTableView)
        
        NSLayoutConstraint.activate([
            photosTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photosTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            photosTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            photosTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
