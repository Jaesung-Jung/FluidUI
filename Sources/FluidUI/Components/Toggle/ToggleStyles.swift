//
//  ToggleStyles.swift
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

// MARK: - Chip Style

public struct FluidChipToggleStyle: ToggleStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    ToggleButton(isOn: configuration.$isOn, label: configuration.label) { isPressed in
      FluidChipToggleContent(
        label: configuration.label,
        isOn: configuration.isOn,
        controlSize: controlSize,
        isPressed: isPressed,
        isEnabled: isEnabled
      )
    }
  }
}

struct FluidChipToggleContent<Label: View>: View {
  let label: Label
  let isOn: Bool
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  @inlinable var tint: AnyShapeStyle {
    isEnabled ? AnyShapeStyle(.tint) : AnyShapeStyle(.fluid.disabled)
  }

  @inlinable var lineWidth: CGFloat {
    switch controlSize {
    case .mini:
      return 1
    case .small:
      return 1
    case .large:
      return 2
    case .extraLarge:
      return 2
    default:
      return 1.5
    }
  }

  var body: some View {
    label
      .font(controlSize.font)
      .scaleEffect(isPressed ? CGSize(width: 0.9, height: 0.9) : CGSize(width: 1, height: 1))
      .padding(controlSize.adjustEdgeInsets(EdgeInsets(horizontal: 8, vertical: 4), 1))
      .foregroundStyle(isOn ? AnyShapeStyle(.white) : tint)
      .background {
        if isOn {
          Capsule(style: .continuous)
            .fill(tint)
        } else {
          Capsule(style: .continuous)
            .strokeBorder(tint, lineWidth: lineWidth)
        }
      }
      .animation(.smooth(duration: 0.3), value: isOn)
      .animation(.smooth(duration: 0.3), value: isPressed)
  }
}

// MARK: - Check Style

public struct FluidCheckboxToggleStyle: ToggleStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    ToggleButton(isOn: configuration.$isOn, label: configuration.label) { isPressed in
      FluidCheckboxToggleContent(
        label: configuration.label,
        isOn: configuration.isOn,
        controlSize: controlSize,
        isPressed: isPressed,
        isEnabled: isEnabled
      )
    }
  }
}

struct FluidCheckboxToggleContent<Label: View>: View {
  let label: Label
  let isOn: Bool
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  var spacing: CGFloat {
    switch controlSize {
    case .large, .extraLarge:
      return 6
    default:
      return 4
    }
  }

  var body: some View {
    HStack(spacing: spacing) {
      if isEnabled {
        Image(systemName: isOn ? "checkmark.square.fill" : "square")
          .foregroundStyle(isOn ? AnyShapeStyle(.tint) : AnyShapeStyle(.fluid.secondary))
        label
      } else {
        Image(systemName: isOn ? "checkmark.square.fill" : "square")
          .foregroundStyle(.fluid.disabled)
        label
          .foregroundStyle(.fluid.disabled)
      }
    }
    .font(controlSize.font)
    .scaleEffect(isPressed ? CGSize(width: 0.9, height: 0.9) : CGSize(width: 1, height: 1))
    .animation(.smooth(duration: 0.3), value: isOn)
    .animation(.smooth(duration: 0.3), value: isPressed)
  }
}

// MARK: - Switch Style

public struct FluidLabelAndSwitchToggleStyle: ToggleStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    ToggleButton(isOn: configuration.$isOn, label: configuration.label) { isPressed in
      FluidLabelAndSwitchToggleContent(
        label: configuration.label,
        isOn: configuration.isOn,
        controlSize: controlSize,
        isPressed: isPressed,
        isEnabled: isEnabled
      )
    }
  }
}

struct FluidLabelAndSwitchToggleContent<Label: View>: View {
  let label: Label
  let isOn: Bool
  let controlSize: ControlSize
  let isPressed: Bool
  let isEnabled: Bool

  var body: some View {
    HStack {
      label
        .font(controlSize.font)
      Spacer(minLength: 12)
      FluidSwitch(isOn: isOn, isPressed: isPressed, isEnabled: isEnabled, controlSize: controlSize)
    }
  }
}

public struct FluidSwitchOnlyToggleStyle: ToggleStyle {
  @Environment(\.controlSize) var controlSize
  @Environment(\.isEnabled) var isEnabled

  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    ToggleButton(isOn: configuration.$isOn, label: configuration.label) { isPressed in
      FluidSwitch(isOn: configuration.isOn, isPressed: isPressed, isEnabled: isEnabled, controlSize: controlSize)
    }
  }
}

// MARK: - FluidSwitch

struct FluidSwitch: View {
  let isOn: Bool
  let isPressed: Bool
  let isEnabled: Bool
  let controlSize: ControlSize
  let size: CGSize
  @inlinable var tint: AnyShapeStyle { isEnabled ? AnyShapeStyle(.tint) : AnyShapeStyle(.fluid.disabled) }

  init(isOn: Bool, isPressed: Bool, isEnabled: Bool, controlSize: ControlSize) {
    self.isOn = isOn
    self.isPressed = isPressed
    self.isEnabled = isEnabled
    self.controlSize = controlSize
    switch controlSize {
    case .mini:
      self.size = CGSize(width: 39, height: 23)
    case .small:
      self.size = CGSize(width: 43, height: 26)
    case .large:
      self.size = CGSize(width: 51, height: 31)
    case .extraLarge:
      self.size = CGSize(width: 55, height: 33)
    default:
      self.size = CGSize(width: 47, height: 28)
    }
  }

  var body: some View {
    HStack {
      if isOn {
        Spacer()
      }
      Capsule(style: .circular)
        .fill(.white)
        .padding(2)
        .aspectRatio(isPressed ? 1.25 : 1, contentMode: .fit)
        .shadow(color: .fluid.shadow.opacity(isEnabled ? 1 : 0.5), radius: 3, x: 0, y: 2)
        .animation(.smooth(duration: 0.3), value: isOn)
        .animation(.smooth(duration: 0.3), value: isPressed)
      if !isOn {
        Spacer()
      }
    }
    .background(isOn ? tint.opacity(1) : AnyShapeStyle(.fluid.gray5).opacity(isEnabled ? 1 : 0.5))
    .mask {
      Capsule(style: .circular)
    }
    .frame(width: size.width, height: size.height)
  }
}

// MARK: - ToggleButton

struct ToggleButton<Label: View, Content: View>: View {
  @Binding var isOn: Bool
  let label: Label
  let content: (Bool) -> Content

  struct Style: ButtonStyle {
    let content: (Bool) -> Content

    func makeBody(configuration: Configuration) -> some View {
      content(configuration.isPressed)
    }
  }

  var body: some View {
    Button {
      isOn.toggle()
    } label: {
      label
    }
    .buttonStyle(Style(content: content))
  }
}

// MARK: - ToggleStyle (Fluid)

extension ToggleStyle where Self == FluidChipToggleStyle {
  public static var fluid: FluidToggleStyles.Type { FluidToggleStyles.self }
}

public struct FluidToggleStyles {
  public static var chip: FluidChipToggleStyle { FluidChipToggleStyle() }
  public static var checkbox: FluidCheckboxToggleStyle { FluidCheckboxToggleStyle() }
  public static var labelAndSwitch: FluidLabelAndSwitchToggleStyle { FluidLabelAndSwitchToggleStyle() }
  public static var switchOnly: FluidSwitchOnlyToggleStyle { FluidSwitchOnlyToggleStyle() }
}

// MARK: - ToggleStyles Preview

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
  let toggles: () -> some View = {
    ForEach(ControlSize.allCases, id: \.self) { controlSize in
      HStack {
        Toggle("Toggle", isOn: .constant(.random()))
          .controlSize(controlSize)
      }
    }
  }
  return NavigationStack {
    List {
      Section {
        toggles().toggleStyle(.fluid.chip)
      } header: {
        header(".fluid.chip")
      }
      .listRowSeparator(.hidden)

      Section {
        toggles().toggleStyle(.fluid.checkbox)
      } header: {
        header(".fluid.checkbox")
      }
      .listRowSeparator(.hidden)

      Section {
        toggles().toggleStyle(.fluid.labelAndSwitch)
      } header: {
        header(".fluid.labelAndSwitch")
      }
      .listRowSeparator(.hidden)

      Section {
        toggles().toggleStyle(.fluid.switchOnly)
      } header: {
        header(".fluid.switchOnly")
      }
      .listRowSeparator(.hidden)
    }
    .navigationTitle("Toggle Preview")
  }
}
