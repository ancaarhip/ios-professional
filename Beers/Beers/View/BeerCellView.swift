//
//  BeerCellView.swift
//  Beers
//
//  Created by Anca Arhip on 15.11.2022.
//

import UIKit

class BeerCellView: UITableViewCell {
    
    static let beerCellId = "BeerCell"
    static rowHeight: CGFloat = 200
    
    let beerLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BeerCellView {
    private func setupUI() {
        contentView.addSubview(beerLabel)
        
        beerLabel.translatesAutoresizingMaskIntoConstraints = false
        beerLabel.text = "Beer label"
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            beerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            beerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
