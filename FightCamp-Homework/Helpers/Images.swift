//
//  Images.swift
//  FightCamp-Homework
//
//  Created by Jenny Luu on 11/7/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

extension UIImageView {

    func setImage(with urlString: String) {
        guard let imageURL = URL(string: urlString) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            if let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

extension UIButton {

    func setButtonImage(with urlString: String) {
        guard let imageURL = URL(string: urlString) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            if let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.setImage(image, for: .normal)
                }
            }
        }
    }
}
