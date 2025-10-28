# UIKitHelpers

A lightweight Swift utility for adaptive UI on `UIViewController`.  
Easily handle different device sizes, orientations, and size classes with a single protocol.

---

## Features

- Automatic detection of device size class (compact, regular)
- Handles orientation changes
- Simple integration with any UIViewController
- Fully customizable `styleUI()` function for buttons, labels, or other UI elements
- Works on iOS 13 and above

---

## Installation

### Swift Package Manager

1. In Xcode, go to `File > Add Packages...`
2. Enter the repository URL: `https://github.com/yourusername/UIKitHelpers`
3. Select the `UIKitHelpers` library and add it to your project

---

## Usage

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
        
        // Enable adaptive UI
        enableAdaptiveUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        styleUI()
    }

    func styleUI() {
        switch sizeClass {
        case (.compact, .compact), (.regular, .compact):
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
