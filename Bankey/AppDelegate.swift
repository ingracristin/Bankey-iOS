//
//  AppDelegate.swift
//  Bankey
//
//  Created by Ingra Cristina on 13/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onBoardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
 //       window?.rootViewController = LoginViewController()
        
        loginViewController.delegate = self
       // window?.rootViewController = loginViewController
       // window?.rootViewController = OnboardingViewController(heroImageName: "pucca1", titleText: "Welcome")
        
        //onboarding
        
        onBoardingContainerViewController.delegate = self
        window?.rootViewController = onBoardingContainerViewController
        return true
    }
}

extension AppDelegate: LoginVieControllerDelegate {
    func didLogin() {
        print("Conseguimos!")
    }
}

extension AppDelegate: OnBoardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("Onboarding Finalizado")
    }
    
    
}
