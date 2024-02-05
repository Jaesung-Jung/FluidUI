//
//  FluidButton.swift
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

// MARK: - FluidButton

public class FluidButton: UIControl {
  let contentView = StatefulHostingView(state: Configuration()) {
    Content(configuration: $0)
  }

  public var configuration: Configuration {
    get { contentView.state }
    set { contentView.state = newValue }
  }

  public override var isHighlighted: Bool {
    didSet {
      contentView.state.isHighligted = isHighlighted
    }
  }

  public override var isEnabled: Bool {
    didSet {
      contentView.state.isEnabled = isEnabled
    }
  }

  public override var intrinsicContentSize: CGSize { contentView.intrinsicContentSize }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(contentView)
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    addSubview(contentView)
  }

  public convenience init(image: UIImage?, style: Style? = nil, role: Role = .default, size: ControlSize? = nil) {
    self.init(frame: .zero)
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
    self.init(frame: .zero)
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
    self.init(frame: .zero)
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

  public override func layoutSubviews() {
    super.layoutSubviews()
    contentView.frame = bounds
  }

  public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    return bounds.contains(point) ? self : super.hitTest(point, with: event)
  }
}

// MARK: - FluidButton.Configuration

extension FluidButton {
  public struct Configuration {
    public var image: UIImage?
    public var imageSpacing: CGFloat = 4
    public var imageAlignment: NSDirectionalRectEdge = .leading
    public var imageRenderingMode: UIImage.RenderingMode = .alwaysTemplate
    public var title: String?
    public var style: Style = .plain
    public var role: Role = .default
    public var controlSize: ControlSize = .regular
    var imageConfiguration: UIImage.Configuration {
      switch controlSize {
      case .mini, .small:
        return .font(.fluid.caption())
      case .large, .extraLarge:
        return .font(.fluid.headline())
      default:
        return .font(.fluid.body())
      }
    }

    var isHighligted: Bool = false
    var isEnabled: Bool = true
  }
}

// MARK: - FluidButton.Style

extension FluidButton {
  public enum Style {
    case plain
    case filled
    case tinted
    case outlined
  }
}

// MARK: - FluidButton.Role

extension FluidButton {
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

// MARK: - FluidButton.Content

extension FluidButton {
  struct Content: View {
    let configuration: Configuration

    func makeLabel() -> some View {
      Group {
        switch configuration.imageAlignment {
        case .top:
          VStack(spacing: configuration.imageSpacing) {
            if let image = configuration.image {
              Image(uiImage: image.withConfiguration(configuration.imageConfiguration).withRenderingMode(configuration.imageRenderingMode))
            }
            if let title = configuration.title {
              Text(title)
            }
          }
        case .bottom:
          VStack(spacing: configuration.imageSpacing) {
            if let title = configuration.title {
              Text(title)
            }
            if let image = configuration.image {
              Image(uiImage: image.withConfiguration(configuration.imageConfiguration).withRenderingMode(configuration.imageRenderingMode))
            }
          }
        case .trailing:
          HStack(spacing: configuration.imageSpacing) {
            if let title = configuration.title {
              Text(title)
            }
            if let image = configuration.image {
              Image(uiImage: image.withConfiguration(configuration.imageConfiguration).withRenderingMode(configuration.imageRenderingMode))
            }
          }
        default:
          HStack(spacing: configuration.imageSpacing) {
            if let image = configuration.image {
              Image(uiImage: image.withConfiguration(configuration.imageConfiguration).withRenderingMode(configuration.imageRenderingMode))
            }
            if let title = configuration.title {
              Text(title)
            }
          }
        }
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
            isPressed: configuration.isHighligted,
            isEnabled: configuration.isEnabled
          )
        case .filled:
          FluidFilledButtonContent(
            label: makeLabel(),
            role: configuration.role.buttonRole,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighligted,
            isEnabled: configuration.isEnabled
          )
        case .tinted:
          FluidTintedButtonContent(
            label: makeLabel(),
            role: configuration.role.buttonRole,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighligted,
            isEnabled: configuration.isEnabled
          )
        case .outlined:
          FluidOutlinedButtonContent(
            label: makeLabel(),
            role: configuration.role.buttonRole,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighligted,
            isEnabled: configuration.isEnabled
          )
        }
      }
    }
  }
}

// MARK: - FluidButton Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let button = FluidButton()
  button.configuration.image = UIImage(systemName: "apple.logo")
  button.configuration.title = "Button"
  button.configuration.style = .filled
  return button
}
