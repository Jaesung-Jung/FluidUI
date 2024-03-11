//
//  UIKit+Extension.swift
//
//  Copyright © 2024 Jaesung Jung. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

// MARK: - UIImage.Configuration (Creation)

extension UIImage.Configuration {
  @inlinable public static func pointSize(_ scale: UIImage.SymbolScale) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(scale: scale)
  }

  @inlinable public static func pointSize(_ pointSize: CGFloat) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(pointSize: pointSize)
  }

  @inlinable public static func weight(_ weight: UIImage.SymbolWeight) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(weight: weight)
  }

  @inlinable public static func pointSize(_ pointSize: CGFloat, weight: UIImage.SymbolWeight) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight)
  }

  @inlinable public static func pointSize(_ pointSize: CGFloat, weight: UIImage.SymbolWeight, scale: UIImage.SymbolScale) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
  }

  @inlinable public static func textStyle(_ textStyle: UIFont.TextStyle) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(textStyle: textStyle)
  }

  @inlinable public static func textStyle(_ textStyle: UIFont.TextStyle, scale: UIImage.SymbolScale) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(textStyle: textStyle, scale: scale)
  }

  @inlinable public static func font(_ font: UIFont) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(font: font)
  }

  @inlinable public static func font(_ font: UIFont, scale: UIImage.SymbolScale) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(font: font, scale: scale)
  }

  @inlinable public static func hierarchicalColor(_ hierarchicalColor: UIColor) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(hierarchicalColor: hierarchicalColor)
  }

  @inlinable public static func paletteColors(_ paletteColors: [UIColor]) -> UIImage.SymbolConfiguration {
    UIImage.SymbolConfiguration(paletteColors: paletteColors)
  }
}

// MARK: - UIView (CALayer)

extension UIView {
  @inlinable public func addSublayer(_ sublayer: CALayer) {
    layer.addSublayer(sublayer)
  }

  @objc public dynamic var cornerRadius: CGFloat {
    get { layer.cornerRadius }
    set { layer.cornerRadius = newValue }
  }

  @objc public dynamic var maskedCorners: CACornerMask {
    get { layer.maskedCorners }
    set { layer.maskedCorners = newValue }
  }

  @objc public dynamic var cornerCurve: CALayerCornerCurve {
    get { layer.cornerCurve }
    set { layer.cornerCurve = newValue }
  }

  @objc public dynamic var borderWidth: CGFloat {
    get { layer.borderWidth }
    set { layer.borderWidth = newValue }
  }

  @objc public dynamic var borderColor: UIColor? {
    get { layer.borderColor.map { UIColor(cgColor: $0) } }
    set { layer.borderColor = newValue?.cgColor }
  }

  @objc public dynamic var shouldRasterize: Bool {
    get { layer.shouldRasterize }
    set { layer.shouldRasterize = newValue }
  }

  @objc public dynamic var rasterizationScale: CGFloat {
    get { layer.rasterizationScale }
    set { layer.rasterizationScale = newValue }
  }
}

// MARK: - UIView (Shadow)

extension UIView {
  public class Shadow {
    let layer: CALayer

    init(_ layer: CALayer) {
      self.layer = layer
    }

    public var color: UIColor? {
      get { layer.shadowColor.map { UIColor(cgColor: $0) } }
      set { layer.shadowColor = newValue?.cgColor }
    }

    public var opacity: Float {
      get { layer.shadowOpacity }
      set { layer.shadowOpacity = newValue }
    }

    public var offset: CGSize {
      get { layer.shadowOffset }
      set { layer.shadowOffset = newValue }
    }

    public var radius: CGFloat {
      get { layer.shadowRadius }
      set { layer.shadowRadius = newValue }
    }

    public var path: UIBezierPath? {
      get { layer.shadowPath.map { UIBezierPath(cgPath: $0) } }
      set { layer.shadowPath = newValue?.cgPath }
    }
  }

  public var shadow: UIView.Shadow { UIView.Shadow(layer) }
}
