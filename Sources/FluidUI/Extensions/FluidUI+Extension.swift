//
//  FluidUI+Extension.swift
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

extension ControlSize {
  @inlinable var font: Font {
    switch self {
    case .mini:
      return .fluid.caption2
    case .small:
      return .fluid.caption
    case .large:
      return .fluid.headline
    case .extraLarge:
      return .fluid.title4
    default:
      return .fluid.body
    }
  }

  @inlinable var uiFont: UIFont {
    switch self {
    case .mini:
      return .fluid.caption2()
    case .small:
      return .fluid.caption()
    case .large:
      return .fluid.headline()
    case .extraLarge:
      return .fluid.title4()
    default:
      return .fluid.body()
    }
  }

  @inlinable func adjustEdgeInsets(_ edgeInsets: EdgeInsets, _ adjustment: CGFloat) -> EdgeInsets {
    let value: CGFloat
    switch self {
    case .mini:
      value = -adjustment * 2
    case .small:
      value = -adjustment
    case .large:
      value = adjustment
    case .extraLarge:
      value = adjustment * 2
    default:
      value = 0
    }
    return EdgeInsets(
      top: edgeInsets.top + value,
      leading: edgeInsets.leading + value,
      bottom: edgeInsets.bottom + value,
      trailing: edgeInsets.trailing + value
    )
  }

  @inlinable var cornerRadius: CGFloat {
    switch self {
    case .mini, .small:
      return 6
    case .large, .extraLarge:
      return 10
    default:
      return 8
    }
  }
}
