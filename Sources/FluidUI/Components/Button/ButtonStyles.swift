//
//  ButtonStyles.swift
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
      .font(controlSize.font)
      .scaleEffect(isPressed ? CGSize(width: 0.9, height: 0.9) : CGSize(width: 1, height: 1))
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
    controlSize.adjustEdgeInsets(EdgeInsets(horizontal: 12, vertical: 9), 2)
  }
}

// MARK: - Plain Style

public struct FluidPlainButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

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
          RoundedRectangle(cornerRadius: 4, style: .continuous)
            .fill(.fluid.highlighted)
            .padding(-EdgeInsets(2))
        }
      }
      .animation(animation, value: isPressed)
  }
}

// MARK: - Filled Style

public struct FluidFilledButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

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

struct FluidFilledButtonContent<Label: View>: FluidButtonContent, View {
  let label: Label
  let role: ButtonRole?
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  var body: some View {
    configuredLabel(label)
      .foregroundStyle(isEnabled ? .white : .fluid.disabled)
      .padding(padding)
      .background {
        Rectangle()
          .fill(isEnabled ? AnyShapeStyle(tintStyle) : AnyShapeStyle(.fluid.disabled.opacity(0.5)))
          .overlay {
            if isPressed {
              Color.fluid.background.opacity(0.33)
            }
          }
          .clipShape(RoundedRectangle(cornerRadius: controlSize.cornerRadius, style: .continuous))
      }
      .animation(animation, value: isPressed)
  }
}

// MARK: - Tinted Style

public struct FluidTintedButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

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
        RoundedRectangle(cornerRadius: controlSize.cornerRadius, style: .continuous)
          .fill(isEnabled ? AnyShapeStyle(tintStyle.opacity(isPressed ? 0.1 : 0.2)) : AnyShapeStyle(.fluid.disabled.opacity(0.2)))
      }
      .animation(animation, value: isPressed)
  }
}

// MARK: - Bordered Style

public struct FluidBorderedButtonStyle: ButtonStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    FluidBorderedButtonContent(
      label: configuration.label,
      role: configuration.role,
      controlSize: controlSize,
      isPressed: configuration.isPressed,
      isEnabled: isEnabled
    )
  }
}

struct FluidBorderedButtonContent<Label: View>: FluidButtonContent, View {
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
        ZStack {
          if isPressed {
            RoundedRectangle(cornerRadius: controlSize.cornerRadius, style: .continuous)
              .fill(.tint.opacity(0.12))
          }
          RoundedRectangle(cornerRadius: controlSize.cornerRadius, style: .continuous)
            .strokeBorder(isEnabled ? AnyShapeStyle(tintStyle) : AnyShapeStyle(.fluid.disabled), lineWidth: 1.5)
        }
      }
      .disabled(!isEnabled)
      .animation(animation, value: isPressed)
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
  public static var bordered: FluidBorderedButtonStyle { FluidBorderedButtonStyle() }
}

// MARK: - ButtonStyles Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let header: (String) -> some View = {
    Text($0)
      .font(.fluid.caption)
      .fontDesign(.monospaced)
      .textCase(nil)
      .padding(4)
      .foregroundStyle(.tint)
      .background(.tint.opacity(0.12))
      .cornerRadius(4)
      .listRowInsets(EdgeInsets(bottom: 8))
  }
  let buttons: () -> some View = {
    ForEach(ControlSize.allCases, id: \.self) { controlSize in
      HStack {
        Button("Button") {
        }
        .controlSize(controlSize)
        Spacer()
        Text("\(controlSize)")
          .font(controlSize.font)
      }
    }
  }
  return NavigationStack {
    List {
      Section {
        buttons().buttonStyle(.fluid.plain)
      } header: {
        header(".fluid.plain")
      }
      .listRowSeparator(.hidden)

      Section {
        buttons().buttonStyle(.fluid.filled)
      } header: {
        header(".fluid.filled")
      }
      .listRowSeparator(.hidden)

      Section {
        buttons().buttonStyle(.fluid.tinted)
      } header: {
        header(".fluid.tinted")
      }
      .listRowSeparator(.hidden)

      Section {
        buttons().buttonStyle(.fluid.bordered)
      } header: {
        header(".fluid.bordered")
      }
      .listRowSeparator(.hidden)
    }
    .navigationTitle("Button Preview")
  }
}
