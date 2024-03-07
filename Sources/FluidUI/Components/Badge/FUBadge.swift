//
//  FUBadge.swift
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

// MARK: - FUBadge

public class FUBadge: FluidComponent<FUBadge.Configuration> {
  public init() {
    super.init(configuration: Configuration()) { Content(configuration: $0) }
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  public convenience init(title: String?, style: Style? = nil, size: ControlSize? = nil) {
    self.init()
    self.configuration.title = title
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }
}

// MARK: - FUBadge.Style

extension FUBadge {
  public enum Style {
    case filled
    case filledCapsule
    case tinted
    case tintedCapsule
  }
}

// MARK: - FUBadge.Configuration

extension FUBadge {
  public struct Configuration: FluidComponentConfiguration {
    public var title: String?
    public var style: Style = .filled
    public var controlSize: ControlSize = .regular
  }
}

// MARK: - FUBadge.Content

extension FUBadge {
  struct Content: View {
    let configuration: Configuration

    var body: some View {
      Group {
        switch configuration.style {
        case .filled:
          FilledBadgeContent(label: makeLabel(), controlSize: configuration.controlSize)
        case .filledCapsule:
          FilledCapsuleBadgeContent(label: makeLabel(), controlSize: configuration.controlSize)
        case .tinted:
          TintedBadgeContent(label: makeLabel(), controlSize: configuration.controlSize)
        case .tintedCapsule:
          TintedCapsuleBadgeContent(label: makeLabel(), controlSize: configuration.controlSize)
        }
      }
    }

    @inlinable func makeLabel() -> some View {
      Group {
        if let title = configuration.title {
          Text(title)
        }
      }
    }
  }
}

// MARK: - FUBadge Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let styles: [FUBadge.Style] = [.filled, .filledCapsule, .tinted, .tintedCapsule]
  let makeBadge: (FUBadge.Style) -> FUBadge = { style in
    FUBadge(title: "Badge", style: style)
  }
  let stackView = UIStackView(arrangedSubviews: styles.map { makeBadge($0) })
  stackView.axis = .vertical
  stackView.spacing = 20
  stackView.alignment = .center
  return stackView
}
