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
//        window?.rootViewController = loginViewController
        
        onboardingContainerViewController.delegate = self
        window?.rootViewController = onboardingContainerViewController
        
        return true
    }
}

// MARK: - LoginViewControllerDelegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("[AppDelegate] Did login")
    }
}

// MARK: - OnboardingContainerViewController
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("[AppDelegate] Did finish Onboarding")
    }
}

