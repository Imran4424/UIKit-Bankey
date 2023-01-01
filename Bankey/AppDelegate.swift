//
//  AppDelegate.swift
//  Bankey
//
//  Created by Shah Md Imran Hossain on 1/1/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        window?.rootViewController = loginViewController
        
        onboardingContainerViewController.delegate = self
        
        return true
    }
}

// MARK: - LoginViewControllerDelegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        setRootViewController(onboardingContainerViewController)
    }
}

// MARK: - OnboardingContainerViewController
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("[AppDelegate] Did finish Onboarding")
    }
}

// MARK: - Set Root View controller
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window, duration: 0.3,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}
