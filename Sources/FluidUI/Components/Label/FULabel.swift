//
//  FULabel.swift
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

// MARK: - FULabel

open class FULabel: UILabel {
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.font = .fluid.body()
    self.textColor = .fluid.primary
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.font = .fluid.body()
    self.textColor = .fluid.primary
  }

  public convenience init(font: UIFont = .fluid.body(), text: String, textColor: UIColor = .fluid.primary, textAlignment: NSTextAlignment = .natural, numberOfLines: Int = 1, contentInsets: UIEdgeInsets = .zero) {
    self.init(frame: .zero)
    self.font = font
    self.text = text
    self.textColor = textColor
    self.textAlignment = textAlignment
    self.numberOfLines = numberOfLines
    self.contentInsets = contentInsets
  }

  open var contentInsets: UIEdgeInsets = .zero {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }

  open override func drawText(in rect: CGRect) {
    let textRect = CGRect(x: contentInsets.top, y: 0, width: rect.width, height: rect.height)
    super.drawText(in: textRect)
  }

  open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    let rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
    return CGRect(
      x: contentInsets.left,
      y: contentInsets.top,
      width: rect.width + contentInsets.horizontal,
      height: rect.height + contentInsets.vertical
    )
  }
}

// MARK: - FULabel Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  FULabel(
    font: .fluid.headline(),
    text: "FULabel",
    numberOfLines: 0,
    contentInsets: UIEdgeInsets(8)
  )
}

