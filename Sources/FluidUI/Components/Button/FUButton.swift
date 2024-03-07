//
//  FUButton.swift
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

// MARK: - FUButton

public class FUButton: FluidControlComponent<FUButton.Configuration> {
  public init() {
    super.init(configuration: Configuration()) { Content(configuration: $0) }
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  public convenience init(image: UIImage?, style: Style? = nil, role: Role = .default, size: ControlSize? = nil) {
    self.init()
    self.configuration.image = image
    self.configuration.role = role
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }

  public convenience init(title: String?, style: Style? = nil, role: Role = .default, size: ControlSize? = nil) {
    self.init()
    self.configuration.title = title
    self.configuration.role = role
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }

  public convenience init(image: UIImage?, title: String?, style: Style? = nil, role: Role = .default, size: ControlSize? = nil) {
    self.init()
    self.configuration.image = image
    self.configuration.title = title
    self.configuration.role = role
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }
}

// MARK: - FUButton.Configuration

extension FUButton {
  public struct Configuration: FluidControlComponentConfiguration {
    public var image: UIImage?
    public var imageAlignment: NSDirectionalRectEdge = .leading
    public var imageRenderingMode: UIImage.RenderingMode = .alwaysTemplate
    public var title: String?
    public var style: Style = .plain
    public var role: Role = .default
    public var controlSize: ControlSize = .regular
    public var controlState: UIControl.State = .normal
    public var showsActivityIndicator: Bool = false
    var imageConfiguration: UIImage.Configuration { .font(controlSize.uiFont) }
  }
}

// MARK: - FUButton.Style

extension FUButton {
  public enum Style {
    case plain
    case filled
    case tinted
    case bordered
  }
}

// MARK: - FUButton.Role

extension FUButton {
  public enum Role {
    case `default`
    case destructive
    case cancel

    var buttonRole: ButtonRole? {
      switch self {
      case .default:
        return nil
      case .destructive:
        return .destructive
      case .cancel:
        return .cancel
      }
    }
  }
}

// MARK: - FUButton.Content

extension FUButton {
  struct Content: View {
    let configuration: Configuration

    @inlinable var activityIndicatorSize: ControlSize {
      switch configuration.controlSize {
      case .mini, .small, .regular:
        return .mini
      default:
        return .regular
      }
    }

    var body: some View {
      Group {
        switch configuration.style {
        case .plain:
          FluidPlainButtonContent(
            label: makeLabel(),
            role: configuration.role.buttonRole,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighlighted,
            isEnabled: configuration.isEnabled && !configuration.showsActivityIndicator
          )
        case .filled:
          FluidFilledButtonContent(
            label: makeLabel(),
            role: configuration.role.buttonRole,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighlighted,
            isEnabled: configuration.isEnabled && !configuration.showsActivityIndicator
          )
        case .tinted:
          FluidTintedButtonContent(
            label: makeLabel(),
            role: configuration.role.buttonRole,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighlighted,
            isEnabled: configuration.isEnabled && !configuration.showsActivityIndicator
          )
        case .bordered:
          FluidBorderedButtonContent(
            label: makeLabel(),
            role: configuration.role.buttonRole,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighlighted,
            isEnabled: configuration.isEnabled && !configuration.showsActivityIndicator
          )
        }
      }
      .overlay {
        if configuration.showsActivityIndicator {
          ProgressView()
            .controlSize(activityIndicatorSize)
        }
      }
    }

    @inlinable func makeImage() -> Image? {
      configuration.image
        .map { $0.withConfiguration(.font(configuration.controlSize.uiFont)) }
        .map { $0.withRenderingMode(configuration.imageRenderingMode) }
        .map { Image(uiImage: $0) }
    }

    @inlinable func makeText() -> Text? {
      configuration.title.map { Text($0) }
    }

    @inlinable func makeContent() -> some View {
      Group {
        switch configuration.imageAlignment {
        case .top:
          VStack(spacing: 6) {
            makeImage()
            makeText()
          }
        case .bottom:
          VStack(spacing: 6) {
            makeText()
            makeImage()
          }
        case .trailing:
          HStack(spacing: 6) {
            makeText()
            makeImage()
          }
        default:
          HStack(spacing: 6) {
            makeImage()
            makeText()
          }
        }
      }
    }

    func makeLabel() -> some View {
      HStack(spacing: 0) {
        Spacer(minLength: 0)
        makeContent()
          .opacity(configuration.showsActivityIndicator ? 0 : 1)
        Spacer(minLength: 0)
      }
    }
  }
}

// MARK: - FUButton Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let styles: [FUButton.Style] = [.plain, .filled, .tinted, .bordered]
  let makeButton: (FUButton.Style) -> FUButton = { style in
    FUButton(image: UIImage(systemName: "apple.logo"), title: "Button", style: style)
  }
  let stackView = UIStackView(arrangedSubviews: styles.map { makeButton($0) })
  stackView.axis = .vertical
  stackView.spacing = 20
  stackView.alignment = .center
  return stackView
}
