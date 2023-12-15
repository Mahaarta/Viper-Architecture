//
//  NewsListTableViewCell.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK:- Methods
    func setCell(title: String, author: String, description: String) {
        titleLabel.text = title
        authorLabel.text = author
        descriptionLabel.text = description
    }
    
}
