//
//  CarouselCell.swift
//  CarouselCollectionView
//
//  Created by Anca Arhip on 26.10.2022.
//

import Foundation

import UIKit

class CarouselCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView()
    lazy var labelView = UILabel()
    
    static let cellId = "CarouselCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 300)
    }
}

extension CarouselCell {
    func setupUI() {
        layout()
        style()
    }
    
    func style() {
        backgroundColor = .clear
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
    }
    
    func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])

        addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            labelView.widthAnchor.constraint(equalTo: widthAnchor),
            labelView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])

    }
}

