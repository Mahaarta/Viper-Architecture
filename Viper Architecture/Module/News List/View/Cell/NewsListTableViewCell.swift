//
//  NewsListTableViewCell.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK:- Methods
    func setCell(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
