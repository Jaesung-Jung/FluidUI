//
//  Fonts.swift
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

// MARK: - UIFont.Fluid

extension UIFont {
  public static let fluid = Fluid.self

  public struct Fluid {
    /// 34pt bold
    @inlinable public static func largeTitle(weight: UIFont.Weight = .heavy, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 28, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 28pt bold
    @inlinable public static func title(weight: UIFont.Weight = .bold, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 24, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 22pt semibold
    @inlinable public static func title2(weight: UIFont.Weight = .semibold, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 22, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 20pt semibold
    @inlinable public static func title3(weight: UIFont.Weight = .semibold, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 20, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 19pt semibold
    @inlinable public static func title4(weight: UIFont.Weight = .semibold, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 18, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 17pt semibold
    @inlinable public static func headline(weight: UIFont.Weight = .semibold, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 17, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 15pt regular
    @inlinable public static func body(weight: UIFont.Weight = .medium, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 15, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 14pt regular
    @inlinable public static func description(weight: UIFont.Weight = .regular, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 14, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 13pt regular
    @inlinable public static func caption(weight: UIFont.Weight = .regular, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 13, weight: weight, width: width, compatibleWith: traitCollection)
    }

    /// 12pt regular
    @inlinable public static func caption2(weight: UIFont.Weight = .regular, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
      .scaledFont(size: 12, weight: weight, width: width, compatibleWith: traitCollection)
    }
  }

  @inlinable static func scaledFont(size: CGFloat, weight: UIFont.Weight = .regular, width: UIFont.Width = .standard, compatibleWith traitCollection: UITraitCollection? = nil) -> UIFont {
    UIFontMetrics.default.scaledFont(
      for: .systemFont(
        ofSize: size,
        weight: weight,
        width: width
      ),
      compatibleWith: traitCollection
    )
  }
}

// MARK: - Font.Fluid

extension Font {
  public static let fluid = Fluid.self

  public struct Fluid {
    /// 34pt bold
    @inlinable public static var largeTitle: Font {
      .custom(".AppleSystemUIFont", size: 28, relativeTo: .largeTitle).weight(.heavy)
    }

    /// 28pt bold
    @inlinable public static var title: Font {
      .custom(".AppleSystemUIFont", size: 24, relativeTo: .title).weight(.bold)
    }

    /// 22pt semibold
    @inlinable public static var title2: Font {
      .custom(".AppleSystemUIFont", size: 22, relativeTo: .title2).weight(.semibold)
    }

    /// 20pt semibold
    @inlinable public static var title3: Font {
      .custom(".AppleSystemUIFont", size: 20, relativeTo: .title3).weight(.semibold)
    }

    /// 19pt semibold
    @inlinable public static var title4: Font {
      .custom(".AppleSystemUIFont", size: 18, relativeTo: .title3).weight(.semibold)
    }

    /// 17pt semibold
    @inlinable public static var headline: Font {
      .custom(".AppleSystemUIFont", size: 17, relativeTo: .headline).weight(.semibold)
    }

    /// 15pt regular
    @inlinable public static var body: Font {
      .custom(".AppleSystemUIFont", size: 15, relativeTo: .body).weight(.medium)
    }

    /// 14pt regular
    @inlinable public static var description: Font {
      .custom(".AppleSystemUIFont", size: 14, relativeTo: .subheadline)
    }

    /// 13pt regular
    @inlinable public static var caption: Font {
      .custom(".AppleSystemUIFont", size: 13, relativeTo: .caption)
    }

    /// 12pt regular
    @inlinable public static var caption2: Font {
      .custom(".AppleSystemUIFont", size: 12, relativeTo: .caption2)
    }
  }
}

// MARK: - Font Preview

@available(iOS 17.0, *)
#Preview {
  struct FontItem {
    let name: String
    let description: String
    let font: Font
  }
  let items = [
    FontItem(
      name: "LargeTitle",
      description: "28pt - heavy",
      font: .fluid.largeTitle
    ),
    FontItem(
      name: "Title",
      description: "24pt - bold",
      font: .fluid.title
    ),
    FontItem(
      name: "Title2",
      description: "22pt - semibold",
      font: .fluid.title2
    ),
    FontItem(
      name: "Title3",
      description: "20pt - semibold",
      font: .fluid.title3
    ),
    FontItem(
      name: "Title4",
      description: "18pt - semibold",
      font: .fluid.title4
    ),
    FontItem(
      name: "Headline",
      description: "17pt - semibold",
      font: .fluid.headline
    ),
    FontItem(
      name: "Body",
      description: "15pt - medium",
      font: .fluid.body
    ),
    FontItem(
      name: "Description",
      description: "14pt - regular",
      font: .fluid.description
    ),
    FontItem(
      name: "Caption",
      description: "13pt - regular",
      font: .fluid.caption
    ),
    FontItem(
      name: "Caption2",
      description: "12pt - regular",
      font: .fluid.caption2
    )
  ]
  return List {
    ForEach(items, id: \.name) { item in
      VStack(alignment: .leading, spacing: 4) {
        Text(item.name)
          .font(item.font)
          .foregroundStyle(.fluid.primary)
        Text(item.description)
          .font(.system(size: 13))
          .foregroundStyle(.fluid.secondary)
      }
    }
  }
}
