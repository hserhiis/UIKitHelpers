//
//  UIWindowScene+Root.swift
//  UIKitHelpers
//
//  Created by Serhii Shapovalov on 28/10/2025.
//

import UIKit

public extension UIWindowScene {
    /// Quickly creates and displays a window with the provided root view controller.
    ///
    /// ```swift
    /// guard let windowScene = (scene as? UIWindowScene) else { return }
    /// window = windowScene.makeRoot(FirstViewController())
    /// ```
    ///
    /// - Parameters:
    ///   - rootVC: The view controller to set as the `rootViewController`.
    @discardableResult
    func makeRoot<T: UIViewController>(_ rootVC: T) -> UIWindow {
        let window = UIWindow(windowScene: self)
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        return window
    }
}
