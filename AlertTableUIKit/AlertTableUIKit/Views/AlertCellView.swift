//
//  AlertCellView.swift
//  AlertTableUIKit
//
//  Created by Anca Arhip on 07.11.2022.
//

import UIKit

class AlertCellView: UITableViewCell {
    
    static let reuseId: String = "AlertCell"
    
    var alertTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func setUp(_ alert: AlertModelView) {
        alertTitle.text = alert.title
    }
}

extension AlertCellView {
    
    func layout() {
        contentView.addSubview(alertTitle)
        
        alertTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            alertTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            alertTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        
        alertTitle.backgroundColor = .green
    }
}

