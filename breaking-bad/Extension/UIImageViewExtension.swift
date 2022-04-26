//
//  Extension.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import Foundation

import UIKit

extension UIImageView {
    
    func cacheImage(from url : String) {
        guard let url = URL(string: url) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
