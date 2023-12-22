//
//  Button.swift
//  Viper Architecture
//
//  Created by Minata on 22/12/2023.
//

import UIKit

class Button: UIButton {
    
    var spinner = UIActivityIndicatorView()
    var isLoading = false {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        spinner.color = .white
        spinner.style = .medium
        spinner.hidesWhenStopped = true
        
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func updateView() {
        if isLoading {
            isEnabled = false
            imageView?.alpha = 0
            titleLabel?.alpha = 0
            spinner.startAnimating()
            
        } else {
            isEnabled = true
            imageView?.alpha = 0
            titleLabel?.alpha = 1
            spinner.stopAnimating()
        }
    }
    
}

