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
    /// windowScene.makeRoot(FirstViewController(), assignTo: &window)
    /// ```
    ///
    /// - Parameters:
    ///   - rootVC: The view controller to set as the `rootViewController`.
    ///   - windowRef: A reference to the `UIWindow?` to retain the window in memory.
    func makeRoot<T: UIViewController>(
        _ rootVC: T,
        assignTo windowRef: inout UIWindow?
    ) {
        let window = UIWindow(windowScene: self)
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        windowRef = window
    }
}
