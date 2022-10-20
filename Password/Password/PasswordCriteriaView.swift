//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by Anca Arhip on 19.10.2022.
//

import UIKit

class PasswordCriteriaView: UIView {
    
    let imageView = UIImageView()
    let labelView = UILabel()
    
    let checkMarkImage = UIImage(systemName: "checkmark.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    
    let stackView = UIStackView()
    
    var  isCriteriaMet: Bool = false {
        didSet{
            if isCriteriaMet {
                imageView.image = checkMarkImage
            } else {
                imageView.image = xmarkImage
            }
        }
    }
    
    init(text: String) {
        super.init(frame: .zero)
        
        labelView.text = text
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
    
    func reset() {
        isCriteriaMet = false
        imageView.image = circleImage
    }
}

extension PasswordCriteriaView {
    
    func style() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = UIFont.preferredFont(forTextStyle: .subheadline)
        labelView.textColor = .secondaryLabel
    }
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(labelView)
        
        // Stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Image
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
        ])
        
        // Label
        NSLayoutConstraint.activate([
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // CHCR
        imageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        labelView.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }
}

