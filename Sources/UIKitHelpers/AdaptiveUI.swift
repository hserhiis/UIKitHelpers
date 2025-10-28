//
//  UIViewController+Adaptive.swift
//  UIKitHelpers
//
//  Created by Yevheniia Kolkova on 28/10/2025.
//

import UIKit

/// 🧠 Протокол для экранов с адаптивным UI
public protocol AdaptiveUI: AnyObject {
    func styleUI()
}

@MainActor
public extension AdaptiveUI where Self: UIViewController {
    
    /// 🚀 Активирует адаптивность интерфейса
    /// Вызывает `styleUI()` при изменении ориентации или size class
    func enableAdaptiveUI() {
        NotificationCenter.default.addObserver(
            forName: UIDevice.orientationDidChangeNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.styleUI()
        }
        
        // вызываем сразу при запуске
        styleUI()
    }
    
    /// 🧩 Удобный helper для получения size class
    var sizeClass: (UIUserInterfaceSizeClass, UIUserInterfaceSizeClass) {
        (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass)
    }
    
    /// 📝 Пример функции styleUI(), которую можно скопировать и адаптировать
    static var styleUIExample: String {
        """
        func styleUI() {
        
            switch sizeClass {
        
            case (.compact, .compact), (.regular, .compact):
                
            case (.regular, .regular):
                
            default:
            
            print("✅ Adaptive UI updated → \\(sizeClass)")
        }
        """
    }
}
