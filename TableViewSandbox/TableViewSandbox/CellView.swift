//
//  Cellview.swift
//  TableViewSandbox
//
//  Created by Anca Arhip on 22.10.2022.
//

import UIKit

class CellView: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
