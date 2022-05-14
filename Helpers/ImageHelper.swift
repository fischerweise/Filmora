//
//  ImageHelper.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 30.04.2022.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    static let fadeAnimation = KingfisherOptionsInfoItem.transition(ImageTransition.fade(0.2))
    
    func set(_ url: String, placeholder: UIImage? = nil, showActivityIndicator: Bool = false) {
        self.kf.setImage(with: URL(string: url), placeholder: placeholder, options: [UIImageView.fadeAnimation])
    }
    
    func setFromApi(_ url: String, placeholder: UIImage? = nil, showActivityIndicator: Bool = false) {
        set(APIManager.shared.imageBaseUrl + url, placeholder: placeholder, showActivityIndicator: showActivityIndicator)
    }
}
