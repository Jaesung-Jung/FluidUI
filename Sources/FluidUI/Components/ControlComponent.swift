//
//  ControlComponent.swift
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

// MARK: - FluidControlComponent

open class FluidControlComponent<Configuration: FluidControlComponentConfiguration>: UIControl {
  private var _observations: [NSKeyValueObservation] = []

  let contentView: StatefulHostingView<Configuration>

  public var configuration: Configuration {
    get { contentView.state }
    set { contentView.state = newValue }
  }

  public init<Content: View>(configuration: Configuration, content: @escaping (Configuration) -> Content) {
    self.contentView = StatefulHostingView(state: configuration, content: content)
    super.init(frame: .zero)
    addSubview(contentView)
    let keyPaths: [KeyPath<FluidControlComponent<Configuration>, Bool>] = [
      \.isHighlighted,
      \.isSelected,
      \.isEnabled,
      \.isFocused
    ]
    _observations = keyPaths.map {
      observe($0, options: .new) { [weak self] _, _ in
        if let self {
          self.configuration.controlState = state
        }
      }
    }
  }

  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open override var intrinsicContentSize: CGSize { contentView.intrinsicContentSize }

  open override func layoutSubviews() {
    super.layoutSubviews()
    contentView.frame = bounds
  }

  open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    bounds.contains(point) ? self : super.hitTest(point, with: event)
  }
}

// MARK: - FluidControlComponentConfiguration

public protocol FluidControlComponentConfiguration: FluidComponentConfiguration {
  var controlState: UIControl.State { get set }
}

extension FluidControlComponentConfiguration {
  @inlinable public var isEnabled: Bool { !controlState.contains(.disabled) }
  @inlinable public var isHighlighted: Bool { controlState.contains(.highlighted) }
  @inlinable public var isSelected: Bool { controlState.contains(.selected) }
  @inlinable public var isFocused: Bool { controlState.contains(.focused) }
}
