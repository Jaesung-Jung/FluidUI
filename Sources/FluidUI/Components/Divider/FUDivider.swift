//
//  FUDivider.swift
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

// MARK: - FUDivider

public class FUDivider: FluidComponent<FUDivider.Configuration> {
  public override var intrinsicContentSize: CGSize {
    switch configuration.axis {
    case .horizontal:
      return CGSize(width: .noIntrinsicMetric, height: max(1, configuration.thickness ?? 1))
    case .vertical:
      return CGSize(width: max(1, configuration.thickness ?? 1), height: .noIntrinsicMetric)
    }
  }

  public var thickness: CGFloat? {
    get { configuration.thickness }
    set {
      configuration.thickness = newValue
      invalidateIntrinsicContentSize()
    }
  }

  public init(axis: Axis, thickness: CGFloat? = nil) {
    super.init(configuration: Configuration(axis: axis, thickness: thickness)) {
      Content(configuration: $0)
    }
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}

// MARK: - FUDivider.Configuration

extension FUDivider {
  public struct Configuration: FluidComponentConfiguration {
    let axis: Axis
    var thickness: CGFloat?

    public var color: UIColor = .fluid.separator
    public var controlSize: ControlSize = .regular
  }
}

// MARK: - FUDivider.Axis

extension FUDivider {
  public enum Axis {
    case horizontal
    case vertical
  }
}

// MARK: - FUDivider.Content

extension FUDivider {
  struct Content: View {
    @Environment(\.displayScale) var displayScale

    let configuration: Configuration

    var body: some View {
      switch configuration.axis {
      case .horizontal:
        Rectangle()
          .fill(Color(uiColor: configuration.color))
          .frame(height: configuration.thickness ?? 1 / displayScale)
      case .vertical:
        Rectangle()
          .fill(Color(uiColor: configuration.color))
          .frame(width: configuration.thickness ?? 1 / displayScale)
      }
    }
  }
}

// MARK: - FUDivider Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let divider = FUDivider(axis: .horizontal)
  return divider
}
