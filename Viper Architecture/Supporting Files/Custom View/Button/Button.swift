//
//  Button.swift
//  Viper Architecture
//
//  Created by Minata on 22/12/2023.
//

import UIKit

class Button: UIButton {
    
    private var spinner = UIActivityIndicatorView()
    public var isLoading = false {
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
    
    private func configureView() {
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
    
    private  func updateView() {
        if isLoading {
            isEnabled = false
            imageView?.alpha = 0
            titleLabel?.alpha = 0
            spinner.startAnimating()
            backgroundColor = self.backgroundColor?.withAlphaComponent(0.4)
            
        } else {
            isEnabled = true
            imageView?.alpha = 0
            titleLabel?.alpha = 1
            spinner.stopAnimating()
            backgroundColor = self.backgroundColor?.withAlphaComponent(1.0)
        }
    }
    
}

