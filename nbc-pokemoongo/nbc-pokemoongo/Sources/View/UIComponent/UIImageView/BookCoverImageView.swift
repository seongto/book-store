//
//  BookCoverImageView.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/9/25.
//

import UIKit
import SnapKit
import Kingfisher


class BookCoverImageView: UIImageView {
    
    let imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init(frame: .zero)
        
        setupProperties()
        loadImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Setup UI & Image

extension BookCoverImageView {
    private func setupProperties() {
        self.contentMode = .scaleAspectFit
        
    }

    private func loadImage() {
        guard let url = URL(string: imageUrl) else { return }
        self.kf.setImage(with: url)
    }
}
