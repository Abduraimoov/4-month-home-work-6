//
//  CustomCollectionViewCell.swift
//  4 month home work 6
//
//  Created by Nurtilek on 1/31/24.
//

import UIKit

extension UIImageView {
    func applyCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

class CustomCollectionViewCell: UICollectionViewCell {
    
    let ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(ImageView)
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: topAnchor),
            ImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        ImageView.applyCornerRadius(16)
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func configure(with Images: Image) {
        ImageView.image = UIImage(named: Images.image)
    }
    
}
