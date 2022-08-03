//
//  PicturesManager.swift
//  PhotoFileManager
//
//  Created by Michael Khavin on 03.08.2022.
//

import Foundation

struct PicturesManager {
    private(set) var pictures: [String] = []
    
    init() {
        getPictures()
    }
    
    mutating func getPictures() {
        let path = (Bundle.main.resourcePath ?? "") + "/Content"
        
        do {
            let pathItems = try FileManager.default.contentsOfDirectory(atPath: path)
            
            pathItems.forEach { item in
                if item.hasPrefix("nssl") {
                    self.pictures.append(item)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
