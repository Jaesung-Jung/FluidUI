//
//  FluidChip.swift
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

// MARK: - FluidChip

public class FluidChip: UIView {
  let contentView: StatefulHostingView<Configuration> = StatefulHostingView(state: Configuration()) {
    Content(configuration: $0)
  }

  public var configuration: Configuration {
    get { contentView.state }
    set { contentView.state = newValue }
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

  public convenience init(image: UIImage?, style: Style? = nil, size: ControlSize? = nil) {
    self.init(frame: .zero)
    self.configuration.image = image
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }

  public convenience init(text: String?, style: Style? = nil, size: ControlSize? = nil) {
    self.init(frame: .zero)
    self.configuration.text = text
    if let style {
      self.configuration.style = style
    }
    if let size {
      self.configuration.controlSize = size
    }
  }

  public convenience init(image: UIImage?, text: String?, style: Style? = nil, size: ControlSize? = nil) {
    self.init(frame: .zero)
    self.configuration.image = image
    self.configuration.text = text
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
}

// MARK: - FluidChip.Style

extension FluidChip {
  public enum Style {
    case filled
    case tinted
    case bordered

    var chipStyle: AnyChipStyle {
      switch self {
      case .filled:
        return AnyChipStyle(FilledChipStyle())
      case .tinted:
        return AnyChipStyle(TintedChipStyle())
      case .bordered:
        return AnyChipStyle(BorderedChipStyle())
      }
    }
  }
}

// MARK: - FluidChip.Content

extension FluidChip {
  struct Content: View {
    let configuration: Configuration

    var body: some View {
      Chip.Content(
        image: configuration.image.map { Image(uiImage: $0.withConfiguration(configuration.imageConfiguration)) },
        text: configuration.text.map { Text($0) }
      )
      .chipStyle(configuration.style.chipStyle)
      .controlSize(configuration.controlSize)
    }
  }
}

// MARK: - FluidChip.Configuration

extension FluidChip {
  public struct Configuration {
    public var image: UIImage?
    public var text: String?
    public var style: Style = .filled
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
  }
}

// MARK: - FluidChip Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let filledChips = UIStackView(
    arrangedSubviews: [
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", size: .large),
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip"),
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", size: .small)
    ]
  )
  filledChips.axis = .vertical
  filledChips.spacing = 8

  let tintedChips = UIStackView(
    arrangedSubviews: [
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", style: .tinted, size: .large),
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", style: .tinted),
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", style: .tinted, size: .small)
    ]
  )
  tintedChips.axis = .vertical
  tintedChips.spacing = 8

  let borderedChips = UIStackView(
    arrangedSubviews: [
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", style: .bordered, size: .large),
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", style: .bordered),
      FluidChip(image: UIImage(systemName: "swift"), text: "Chip", style: .bordered, size: .small)
    ]
  )
  borderedChips.axis = .vertical
  borderedChips.spacing = 8

  let stackView = UIStackView(
    arrangedSubviews: [
      filledChips,
      tintedChips,
      borderedChips
    ]
  )
  stackView.axis = .vertical
  stackView.spacing = 40
  return stackView
}
