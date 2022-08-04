//
//  DetailView.swift
//  PhotoFileManager
//
//  Created by Michael Khavin on 04.08.2022.
//

import UIKit

class DetailView: UIView {
    lazy var pictureImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(pictureImageView)
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setSubviewsLayout() {
        NSLayoutConstraint.activate([
            pictureImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            pictureImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            pictureImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            pictureImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
