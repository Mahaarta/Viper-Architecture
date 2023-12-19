//
//  LoginViewController.swift
//  Viper Architecture
//
//  Created by Minata on 18/12/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var loginTitleLabel: UILabel!
    @IBOutlet weak var loginDescLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextView: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var presenter: LoginViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureKeyboard()
        configureLoginTitleLabel()
        configureLoginDescLabel()
        configureUsernameLabel()
        configureUsernameTextView()
        configurePasswordLabel()
        configurePasswordTextView()
        configureLoginButton()
    }
    
    /// Configure `Keyboard`
    private func configureKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

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
        usernameTextView.font = FontSans(fontSansType: .regular, fontSize: 14).set()
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
        passwordTextView.font = FontSans(fontSansType: .regular, fontSize: 14).set()
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
    
    private func findFirstResponder(view: UIView) -> UIView? {
        if view.isFirstResponder {
            return view
        }
        
        for subview in view.subviews {
            if let firstResponder = findFirstResponder(view: subview) {
                return firstResponder
            }
        }
        
        return nil
    }
    
    // MARK: Action
    @objc func loginButtonTapped() {
        presenter?.loginProcess(username: "mor_2314", password: "83r5^_")
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect = view.frame
        aRect.size.height -= keyboardSize.height
        
        if let activeTextField = findFirstResponder(view: contentView) {
            if !aRect.contains(activeTextField.frame.origin) {
                scrollView.scrollRectToVisible(activeTextField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
}

// MARK: - LiveNewsListPresenterToViewProtocol
extension LoginViewController: LoginPresenterToViewProtocol {
    func loginSuccess() {
        let alert = UIAlertController(title: "Nice!", message: "Login Success", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Whoops!", message: "Login Failed", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


@available(iOS 17.0, *)
#Preview {
    let loginVC = LoginViewController()
    return loginVC
}