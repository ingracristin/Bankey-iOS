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
    var hasOnboarded = false
    
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
 //       window?.rootViewController = LoginViewController()
        
        loginViewController.delegate = self
        window?.rootViewController = loginViewController
       // window?.rootViewController = OnboardingViewController(heroImageName: "pucca1", titleText: "Welcome")
        
        //onboarding
        
        onboardingContainerViewController.delegate = self
        //window?.rootViewController = onBoardingContainerViewController
        
        
        //dummy
        dummyViewController.logoutDelegate = self
        
        return true
        
    }
}
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}


extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if hasOnboarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
        
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        print("AAAAAA")
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        hasOnboarded = true
        setRootViewController(dummyViewController)
    }
}
