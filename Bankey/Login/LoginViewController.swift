//
//  LoginViewController.swift
//  Bankey
//
//  Created by Shah Md Imran Hossain on 1/1/23.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
     func didLogin()
}

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessagelabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    weak var delegate: LoginViewControllerDelegate?
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        // login view
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        // signIn Button
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        // error message label
        errorMessagelabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessagelabel.textAlignment = .center
        errorMessagelabel.textColor = .systemRed
        errorMessagelabel.numberOfLines = 0
        errorMessagelabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessagelabel)
        
        // login view constraint
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // sign in button constraint
        // my solution
//        NSLayoutConstraint.activate([
//            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
//            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
//        ])
        
        // sign in button constraint
        // instructor solution
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // error mesage label
        NSLayoutConstraint.activate([
            errorMessagelabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessagelabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessagelabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessagelabel.isHidden = true
        login()
    }
    
    private func login() {
        guard
            let username,
            let password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "username / password can not be blank")
            return
        }
        
        if username == "Imran" && password == "warrior" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessagelabel.text = message
        errorMessagelabel.isHidden = false
    }
}
