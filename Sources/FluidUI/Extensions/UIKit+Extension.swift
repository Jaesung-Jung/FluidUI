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
