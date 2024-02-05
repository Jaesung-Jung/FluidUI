//
//  ButtonStyle.swift
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

// MARK: - FluidButtonContent

protocol FluidButtonContent {
  associatedtype Label: View

  var controlSize: ControlSize { get }
  var isEnabled: Bool { get }
  var label: Label { get }
  var role: ButtonRole? { get }
  var isPressed: Bool { get }
}

extension FluidButtonContent {
  func configuredLabel<Label: View>(_ label: Label) -> some View {
    label
      .font(font)
      .scaleEffect(isPressed ? CGSize(width: 0.95, height: 0.95) : CGSize(width: 1, height: 1))
  }

  var animation: Animation { .smooth(duration: 0.3) }

  var tintStyle: some ShapeStyle {
    guard let role else {
      return AnyShapeStyle(.tint)
    }
    switch role {
    case .destructive:
      return AnyShapeStyle(.fluid.red)
    case .cancel:
      return AnyShapeStyle(.fluid.gray)
    default:
      return AnyShapeStyle(.tint)
    }
  }

  var padding: EdgeInsets {
    switch controlSize {
    case .mini, .small:
      return EdgeInsets(horizontal: 10, vertical: 6)
    case .large, .extraLarge:
      return EdgeInsets(horizontal: 14, vertical: 10)
    default:
      return EdgeInsets(horizontal: 12, vertical: 8)
    }
  }

  var cornerRadius: CGFloat {
    switch controlSize {
    case .mini, .small:
      return 6
    case .large, .extraLarge:
      return 10
    default:
      return 8
    }
  }

  var font: Font {
    switch controlSize {
    case .mini, .small:
      return .fluid.caption
    case .large, .extraLarge:
      return .fluid.headline
    default:
      return .fluid.body
    }
  }
}

// MARK: - FluidPlainButtonContent

struct FluidPlainButtonContent<Label: View>: FluidButtonContent, View {
  let label: Label
  let role: ButtonRole?
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  var body: some View {
    configuredLabel(label)
      .foregroundStyle(isEnabled ? AnyShapeStyle(tintStyle) : AnyShapeStyle(.fluid.disabled))
      .background {
        if isPressed {
          RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(.fluid.highlighted)
            .padding(-padding)
        }
      }
      .animation(animation, value: isPressed)
  }
}

// MARK: - FluidFilledButtonContent

struct FluidFilledButtonContent<Label: View>: FluidButtonContent, View {
  let label: Label
  let role: ButtonRole?
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  var body: some View {
    configuredLabel(label)
      .foregroundStyle(isEnabled ? .white : .white.opacity(0.75))
      .padding(padding)
      .background {
        Rectangle()
          .fill(isEnabled ? AnyShapeStyle(tintStyle) : AnyShapeStyle(.fluid.disabled))
          .overlay {
            if isPressed {
              Color.fluid.background.opacity(0.33)
            }
          }
          .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
      }
      .animation(animation, value: isPressed)
  }
}

// MARK: - FluidTintedButtonContent

struct FluidTintedButtonContent<Label: View>: FluidButtonContent, View {
  let label: Label
  let role: ButtonRole?
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  var body: some View {
    configuredLabel(label)
      .foregroundStyle(isEnabled ? AnyShapeStyle(tintStyle) : AnyShapeStyle(.fluid.disabled))
      .padding(padding)
      .background {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
          .fill(tintStyle.opacity(isPressed ? 0.1 : 0.2))
      }
      .animation(animation, value: isPressed)
  }
}

// MARK: - FluidOutlinedButtonContent

struct FluidOutlinedButtonContent<Label: View>: FluidButtonContent, View {
  let label: Label
  let role: ButtonRole?
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  var body: some View {
    configuredLabel(label)
      .foregroundStyle(isEnabled ? AnyShapeStyle(tintStyle) : AnyShapeStyle(.fluid.disabled))
      .padding(padding)
      .background {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
          .strokeBorder(isEnabled ? AnyShapeStyle(tintStyle) : AnyShapeStyle(.fluid.disabled), lineWidth: 1.5)
      }
      .opacity(isPressed ? 0.5 : 1)
      .disabled(!isEnabled)
      .animation(animation, value: isPressed)
  }
}

// MARK: - FluidPlainButtonStyle

public struct FluidPlainButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public func makeBody(configuration: Configuration) -> some View {
    FluidPlainButtonContent(
      label: configuration.label,
      role: configuration.role,
      controlSize: controlSize,
      isPressed: configuration.isPressed,
      isEnabled: isEnabled
    )
  }
}

// MARK: - FluidFilledButtonStyle

public struct FluidFilledButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public func makeBody(configuration: Configuration) -> some View {
    FluidFilledButtonContent(
      label: configuration.label,
      role: configuration.role,
      controlSize: controlSize,
      isPressed: configuration.isPressed,
      isEnabled: isEnabled
    )
  }
}

// MARK: - FluidTintedButtonStyle

public struct FluidTintedButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public func makeBody(configuration: Configuration) -> some View {
    FluidTintedButtonContent(
      label: configuration.label,
      role: configuration.role,
      controlSize: controlSize,
      isPressed: configuration.isPressed,
      isEnabled: isEnabled
    )
  }
}

// MARK: - FluidOutlinedButtonStyle

public struct FluidOutlinedButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public func makeBody(configuration: Configuration) -> some View {
    FluidOutlinedButtonContent(
      label: configuration.label,
      role: configuration.role,
      controlSize: controlSize,
      isPressed: configuration.isPressed,
      isEnabled: isEnabled
    )
  }
}

// MARK: - ButtonStyle (Fluid)

extension ButtonStyle where Self == FluidPlainButtonStyle  {
  public static var fluid: FluidButtonStyles.Type { FluidButtonStyles.self }
}

public struct FluidButtonStyles {
  public static var plain: FluidPlainButtonStyle { FluidPlainButtonStyle() }
  public static var filled: FluidFilledButtonStyle { FluidFilledButtonStyle() }
  public static var tinted: FluidTintedButtonStyle { FluidTintedButtonStyle() }
  public static var outlined: FluidOutlinedButtonStyle { FluidOutlinedButtonStyle() }
}

// MARK: - ButtonStyle Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let sizes: [ControlSize] = [.small, .regular, .large]
  let buttons: () -> some View = {
    ForEach(sizes, id: \.hashValue) {
      Button("Button", systemImage: "apple.logo") {
      }
      .controlSize($0)
    }
  }
  return Grid(horizontalSpacing: 20, verticalSpacing: 40) {
    GridRow {
      buttons()
    }
    .buttonStyle(.fluid.plain)

    GridRow {
      buttons()
    }
    .buttonStyle(.fluid.filled)

    GridRow {
      buttons()
    }
    .buttonStyle(.fluid.tinted)

    GridRow {
      buttons()
    }
    .buttonStyle(.fluid.outlined)
  }
}
