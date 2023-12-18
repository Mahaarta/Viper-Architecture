//
//  LoginViewController.swift
//  Viper Architecture
//
//  Created by Minata on 18/12/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTitleLabel: UILabel!
    @IBOutlet weak var loginDescLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextView: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoginTitleLabel()
        configureLoginDescLabel()
        configureUsernameLabel()
        configureUsernameTextView()
        configurePasswordLabel()
        configurePasswordTextView()
        configureLoginButton()
    }
    
    /// Configure `Login Title`
    private func configureLoginTitleLabel() {
        loginTitleLabel.text = "Login"
        loginTitleLabel.font = FontSans(fontSansType: .medium, fontSize: 25).set()
        loginTitleLabel.textAlignment = .left
    }
    
    /// Configure `Login Title`
    private func configureLoginDescLabel() {
        loginDescLabel.text = "Please enter your data to continue"
        loginDescLabel.font = FontSans(fontSansType: .regular, fontSize: 14).set()
        loginDescLabel.textAlignment = .left
        loginDescLabel.textColor = .lightGray
    }
    
    /// Configure `Username textView`
    private func configureUsernameLabel() {
        usernameLabel.text = "User Name"
        usernameLabel.font = FontSans(fontSansType: .regular, fontSize: 12).set()
        usernameLabel.textAlignment = .left
    }
    
    private func configureUsernameTextView() {
        usernameTextView.autocorrectionType = .no
        usernameTextView.clearButtonMode = .whileEditing
        usernameTextView.font = FontSans(fontSansType: .regular, fontSize: 12).set()
    }
    
    /// Configure `Password textView`
    private func configurePasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.font = FontSans(fontSansType: .regular, fontSize: 12).set()
        passwordLabel.textAlignment = .left
    }
    
    /// Configure `password textView`
    private func configurePasswordTextView() {
        passwordTextView.autocorrectionType = .no
        passwordTextView.font = FontSans(fontSansType: .regular, fontSize: 12).set()
        passwordTextView.isSecureTextEntry = true
    }
    
    /// Configure `Login Button`
    private func configureLoginButton() {
        let attr = [NSAttributedString.Key.font: FontSans(fontSansType: .medium, fontSize: 16).set()]
        let attributes = NSAttributedString(string: "Login", attributes: attr)
        
        loginButton.tintColor = .white
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setAttributedTitle(attributes, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: Action
    @objc func loginButtonTapped() {
        
    }
    
}

@available(iOS 17.0, *)
#Preview {
    let loginVC = LoginViewController()
    return loginVC
}
