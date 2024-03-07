//
//  FUSwitch.swift
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

// MARK: - FUChip

public class FUSwitch: FluidControlComponent<FUSwitch.Configuration> {
  public var isOn: Bool {
    get { configuration.isOn }
    set {
      guard configuration.isOn != newValue else {
        return
      }
      configuration.isOn = newValue
    }
  }

  public var style: Style {
    get { configuration.style }
    set {
      guard configuration.style != newValue else {
        return
      }
      configuration.style = newValue
      invalidateIntrinsicContentSize()
    }
  }

  public init() {
    super.init(configuration: Configuration()) { Content(configuration: $0) }
    addTarget(self, action: #selector(handleTouchUpInside), for: .touchUpInside)
  }

  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  public convenience init(image: UIImage?, style: Style? = nil, size: ControlSize? = nil) {
    self.init()
    self.configuration.offImage = image
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
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

  public convenience init(image: UIImage?, title: String?, style: Style? = nil, size: ControlSize? = nil) {
    self.init()
    self.configuration.offImage = image
    self.configuration.title = title
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }

  public convenience init(onImage: UIImage?, offImage: UIImage?, title: String? = nil, style: Style? = nil, size: ControlSize? = nil) {
    self.init()
    self.configuration.onImage = onImage
    self.configuration.offImage = offImage
    self.configuration.title = title
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }

  @objc func handleTouchUpInside() {
    configuration.isOn.toggle()
    sendActions(for: .valueChanged)
    invalidateIntrinsicContentSize()
  }
}

// MARK: - FUSwitch.Configuration

extension FUSwitch {
  public struct Configuration: FluidControlComponentConfiguration {
    var isOn: Bool = false
    var style: Style = .switch
    public var offImage: UIImage?
    public var onImage: UIImage?
    public var imageRenderingMode: UIImage.RenderingMode = .alwaysTemplate
    public var title: String?
    public var titleColor: UIColor?
    public var controlSize: ControlSize = .regular
    public var controlState: UIControl.State = .normal
  }
}

// MARK: - FUSwitch.Style

extension FUSwitch {
  public enum Style: Equatable {
    case `switch`
    case label
    case chip
    case checkbox
  }
}

// MARK: - FUSwitch.Content

extension FUSwitch {
  struct Content: View {
    let configuration: Configuration

    @inlinable var image: UIImage? {
      if configuration.isOn {
        return configuration.onImage ?? configuration.offImage
      }
      return configuration.offImage
    }

    var label: some View {
      HStack(spacing: 6) {
        if let image {
          Image(uiImage: image.withConfiguration(.font(configuration.controlSize.uiFont)).withRenderingMode(configuration.imageRenderingMode))
        }
        if let title = configuration.title {
          Text(title)
            .font(configuration.controlSize.font)
        }
      }
    }

    var body: some View {
      switch configuration.style {
      case .switch:
        FluidSwitch(
          isOn: configuration.isOn,
          isPressed: configuration.isHighlighted,
          isEnabled: configuration.isEnabled,
          controlSize: configuration.controlSize
        )
      case .label:
        label
          .foregroundStyle(configuration.isEnabled ? AnyShapeStyle(.tint) : AnyShapeStyle(.fluid.disabled))
          .scaleEffect(configuration.isHighlighted ? CGSize(width: 0.9, height: 0.9) : CGSize(width: 1, height: 1))
          .animation(.smooth(duration: 0.3), value: configuration.isOn)
          .animation(.smooth(duration: 0.3), value: configuration.isHighlighted)
      case .chip:
        FluidChipToggleContent(
          label: label,
          isOn: configuration.isOn,
          controlSize: configuration.controlSize,
          isPressed: configuration.isHighlighted,
          isEnabled: configuration.isEnabled
        )
      case .checkbox:
        if let titleColor = configuration.titleColor {
          FluidCheckboxToggleContent(
            label: label.foregroundStyle(configuration.isEnabled ? AnyShapeStyle(Color(uiColor: titleColor)) : AnyShapeStyle(.fluid.disabled)),
            isOn: configuration.isOn,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighlighted,
            isEnabled: configuration.isEnabled
          )
        } else {
          FluidCheckboxToggleContent(
            label: label.foregroundStyle(configuration.isEnabled ? AnyShapeStyle(.fluid.primary) : AnyShapeStyle(.fluid.disabled)),
            isOn: configuration.isOn,
            controlSize: configuration.controlSize,
            isPressed: configuration.isHighlighted,
            isEnabled: configuration.isEnabled
          )
        }
      }
    }
  }
}

// MARK: - FUSwitch Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let switches = UIStackView(
    arrangedSubviews: ControlSize.allCases.map {
      FUSwitch(image: UIImage(systemName: "swift"), title: "Switch", size: $0)
    }
  )
  switches.axis = .vertical
  switches.spacing = 8

  let labels = UIStackView(
    arrangedSubviews: ControlSize.allCases.map {
      FUSwitch(
        onImage: UIImage(systemName: "circle.fill"),
        offImage: UIImage(systemName: "circle"),
        title: "Label",
        style: .label,
        size: $0
      )
    }
  )
  labels.axis = .vertical
  labels.spacing = 8

  let chips = UIStackView(
    arrangedSubviews: ControlSize.allCases.map {
      FUSwitch(image: UIImage(systemName: "swift"), title: "Chip", style: .chip, size: $0)
    }
  )
  chips.axis = .vertical
  chips.spacing = 8

  let checkboxes = UIStackView(
    arrangedSubviews: ControlSize.allCases.map {
      FUSwitch(title: "Checkbox", style: .checkbox, size: $0)
    }
  )
  checkboxes.axis = .vertical
  checkboxes.spacing = 8

  let items = UIStackView(arrangedSubviews: [switches, labels, chips, checkboxes])
  items.axis = .vertical
  items.spacing = 40
  return items
}
