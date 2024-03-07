//
//  FUDisclosureIndicator.swift
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

import SwiftUI

// MARK: - FUDisclosureIndicator

public class FUDisclosureIndicator: UIView {
  let imageView = UIImageView()
  let size: ControlSize

  public override var intrinsicContentSize: CGSize { imageView.intrinsicContentSize }

  public override init(frame: CGRect) {
    self.size = .regular
    super.init(frame: frame)
    self.tintColor = .fluid.primary
    addSubview(imageView)
    updateIndicatorImage()
  }

  public required init?(coder: NSCoder) {
    self.size = .regular
    super.init(coder: coder)
    self.tintColor = .fluid.primary
    addSubview(imageView)
    updateIndicatorImage()
  }

  public init(size: ControlSize) {
    self.size = size
    super.init(frame: .zero)
    self.tintColor = .fluid.primary
    addSubview(imageView)
    updateIndicatorImage()
  }

  public override func layoutSubviews() {
    super.layoutSubviews()
    imageView.frame = bounds
  }

  func updateIndicatorImage() {
    let image: UIImage?
    if traitCollection.layoutDirection == .rightToLeft {
      image = UIImage(systemName: "chevron.left")
    } else {
      image = UIImage(systemName: "chevron.right")
    }
    imageView.image = image?.withConfiguration(.font(size.uiFont))
  }
}

// MARK: - FUDisclosureIndicator Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  FUDisclosureIndicator()
}
