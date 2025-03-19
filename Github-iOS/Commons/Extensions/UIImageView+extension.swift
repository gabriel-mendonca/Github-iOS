//
//  UIImageView+extension.swift
//  Github-iOS
//
//  Created by Gabriel on 18/03/25.
//

import UIKit

extension UIImageView {
    
    func renderImageView(urlImage: String) {
        self.image = UIImage(named: "placeholder")
        if let urlPhoto = URL(string: urlImage) {
            URLSession.shared.dataTask(with: urlPhoto) { [weak self] data, response, error in
                guard let self else { return }
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    let image = UIImage(data: data)
                    self.image = image
                    self.contentMode = .scaleAspectFit
                }
            }.resume()
        }
    }
}
