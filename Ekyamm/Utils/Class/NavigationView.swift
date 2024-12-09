//
//  NavigationView.swift
//  Ekyamm
//
//  Created by Ravi Seta on 02/12/24.
//

import UIKit

class NavigationView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    private func setupGradient() {
        // Define gradient colors
        gradientLayer.colors = [
            UIColor(red: 176/255, green: 164/255, blue: 245/255, alpha: 1).cgColor, // #B0A4F5
            UIColor(red: 237/255, green: 161/255, blue: 151/255, alpha: 1).cgColor  // #EDA197
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)   // Bottom-right
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update gradient frame
        gradientLayer.frame = bounds
    }
}

class GradientBgView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    private func setupGradient() {
        // Define gradient colors
        gradientLayer.colors = [
            UIColor(red: 235/255, green: 209/255, blue: 221/255, alpha: 1).cgColor, // #B0A4F5
            UIColor(red: 242/255, green: 208/255, blue: 212/255, alpha: 1).cgColor  // #EDA197
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)   // Bottom-right
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

class ButtonGradientView: UIButton {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 176/255, green: 164/255, blue: 245/255, alpha: 1).cgColor, // #B0A4F5
            UIColor(red: 237/255, green: 161/255, blue: 151/255, alpha: 1).cgColor  // #EDA197
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)   // Bottom-right
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 8
        
    }
}

class GradientBorderView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private let shapeLayer = CAShapeLayer()
    
    var gradientColors: [CGColor] = [
        UIColor(red: 176/255, green: 164/255, blue: 245/255, alpha: 1).cgColor, // #B0A4F5
        UIColor(red: 237/255, green: 161/255, blue: 151/255, alpha: 1).cgColor  // #EDA197
    ] {
        didSet {
            gradientLayer.colors = gradientColors
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientBorder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientBorder()
    }
    
    private func setupGradientBorder() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = gradientColors
        layer.addSublayer(gradientLayer)
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        gradientLayer.mask = shapeLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set the frame of the gradient layer
        gradientLayer.frame = bounds
        
        // Create a path for the border
        let path = UIBezierPath(roundedRect: bounds.insetBy(dx: 1 / 2, dy: 1 / 2),
                                cornerRadius: 20)
        shapeLayer.path = path.cgPath
    }
}
