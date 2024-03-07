//
//  FUActivityIndicatorView.swift
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

// MARK: - FUActivityIndicatorView

public class FUActivityIndicatorView: FluidComponent<FUActivityIndicatorView.Configuration> {
  public var isAnimating: Bool {
    configuration.isAnimating
  }

  public init() {
    super.init(configuration: Configuration()) { Content(configuration: $0) }
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  public func startAnimating() {
    configuration.isAnimating = true
  }

  public func stopAnimating() {
    configuration.isAnimating = false
  }
}

// MARK: - FUActivityIndicatorView.Style

extension FUActivityIndicatorView {
  public enum Style {
    case circleFade
    case circleScale
  }
}

// MARK: - FUActivityIndicatorView.Configuration

extension FUActivityIndicatorView {
  public struct Configuration: FluidComponentConfiguration {
    var isAnimating: Bool = false
    public var style: Style = .circleFade
    public var hidesWhenStopped: Bool = true
    public var controlSize: ControlSize = .regular
  }
}

// MARK: - FUActivityIndicatorView.Content

extension FUActivityIndicatorView {
  struct Content: View {
    let configuration: Configuration

    var body: some View {
      if configuration.isAnimating {
        switch configuration.style {
        case .circleFade:
          FluidCircleFadeProgressViewContent(label: EmptyView(), controlSize: .regular)
        case .circleScale:
          FluidCircleScaleProgressContent(label: EmptyView(), controlSize: .regular)
        }
      }
    }
  }
}

// MARK: - FUActivityIndicatorView Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let styles: [FUActivityIndicatorView.Style] = [.circleFade, .circleScale]
  let makeActivityIndicator: (FUActivityIndicatorView.Style) -> FUActivityIndicatorView = { style in
    let activityIndicator = FUActivityIndicatorView()
    activityIndicator.configuration.style = style
    activityIndicator.startAnimating()
    return activityIndicator
  }
  let stackView = UIStackView(arrangedSubviews: styles.map { makeActivityIndicator($0) })
  stackView.axis = .vertical
  stackView.spacing = 20
  stackView.alignment = .center
  return stackView
}
