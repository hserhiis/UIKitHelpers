# UIKitHelpers

A lightweight Swift utility for adaptive UI on `UIViewController`.  
Easily handle different device sizes, orientations, and size classes with a single protocol.

---

## Features

| 🧠 `AdaptiveUI` | Protocol for auto-updating UI when orientation or size class changes |
| 🪄 `UIWindowScene.makeRoot()` | Quickly set a root view controller in your SceneDelegate |
| ⏳ `delay()` | Run closures with a delay on the main thread |
| ⚡️ `showAlertWithFunction()` | Display alerts and run code when the user taps “OK” |


---

## Installation

### Swift Package Manager

1. In Xcode, go to `File > Add Packages...`
2. Enter the repository URL: `https://github.com/hserhiis/UIKitHelpers`
3. Select the `UIKitHelpers` library and add it to your project

---

## 🚀 Usage

### Step 1 — Conform to the Protocol

Make your view controller adopt the `AdaptiveUI` protocol and call `enableAdaptiveUI()` inside `viewDidLoad()`.

```swift
import UIKit
import UIKitHelpers

class MyViewController: UIViewController, AdaptiveUI {

 @IBOutlet weak var scoreLabel: UILabel!
 @IBOutlet weak var answerOneButton: UIButton!
 @IBOutlet weak var answerTwoButton: UIButton!
 @IBOutlet weak var answerThreeButton: UIButton!

 override func viewDidLoad() {
     super.viewDidLoad()
     
     // Enable automatic UI adaptation
     enableAdaptiveUI()
 }

 override func viewWillLayoutSubviews() {
     super.viewWillLayoutSubviews()
     styleUI()
 }

 // MARK: - AdaptiveUI
 func styleUI() {
     switch sizeClass {
     case (.compact, .compact),
          (.regular, .compact):
         [answerOneButton, answerTwoButton, answerThreeButton].forEach {
             $0?.layer.cornerRadius = 6
             $0?.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
         }
         scoreLabel.font = .systemFont(ofSize: 18)

     case (.regular, .regular):
         [answerOneButton, answerTwoButton, answerThreeButton].forEach {
             $0?.layer.cornerRadius = 10
             $0?.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
         }
         scoreLabel.font = .systemFont(ofSize: 30)

     default:
         [answerOneButton, answerTwoButton, answerThreeButton].forEach {
             $0?.layer.cornerRadius = 6
             $0?.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
         }
         scoreLabel.font = .systemFont(ofSize: 16)
     }
     
     print("✅ Adaptive UI updated → \(sizeClass)")
 }
}

## 🪄 UIWindowScene Helper

You can quickly configure your app’s root controller inside your `SceneDelegate.swift`:

```swift
import UIKit
import UIKitHelpers

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        windowScene.makeRoot(FirstViewController(), assignTo: &window)
    }
}

