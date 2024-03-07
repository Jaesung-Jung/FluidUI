//
//  BadgeStyles.swift
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

// MARK: - BadgeStyle

public protocol BadgeStyle {
  associatedtype Body: View
  typealias Configuration = BadgeStyleConfiguration

  func makeBody(configuration: Configuration) -> Body
}

// MARK: - BadgeStyleConfiguration

public struct BadgeStyleConfiguration {
  let label: BadgeStyleConfiguration.Label
  let controlSize: ControlSize

  struct Label: View {
    var body: AnyView

    init<Content: View>(content: Content) {
      body = AnyView(content)
    }
  }
}

// MARK: - BadgeContent

protocol BadgeContent {
  var controlSize: ControlSize { get }
}

extension BadgeContent {
  var font: Font {
    switch controlSize {
    case .mini:
      return .fluid.caption2
    case .small:
      return .fluid.caption2
    case .large:
      return .fluid.description
    case .extraLarge:
      return .fluid.body
    default:
      return .fluid.caption
    }
  }

  var cornerRadius: CGFloat {
    switch controlSize {
    case .mini:
      return 4
    case .small:
      return 4
    case .large:
      return 5
    case .extraLarge:
      return 5
    default:
      return 4
    }
  }
}

// MARK: - FilledBadgeStyle

public struct FilledBadgeStyle: BadgeStyle {
  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    FilledBadgeContent(
      label: configuration.label,
      controlSize: configuration.controlSize
    )
  }
}

struct FilledBadgeContent<Label: View>: View, BadgeContent {
  let label: Label
  let controlSize: ControlSize

  var body: some View {
    BadgeLayout(controlSize: controlSize) {
      label
    }
    .font(font)
    .foregroundStyle(.white)
    .background {
      RoundedRectangle(cornerRadius: cornerRadius)
        .fill(.tint)
    }
  }
}

extension BadgeStyle where Self == FilledBadgeStyle {
  public static var filled: FilledBadgeStyle { FilledBadgeStyle() }
}

// MARK: - FilledCapsuleBadgeStyle

public struct FilledCapsuleBadgeStyle: BadgeStyle {
  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    FilledCapsuleBadgeContent(
      label: configuration.label,
      controlSize: configuration.controlSize
    )
  }
}

struct FilledCapsuleBadgeContent<Label: View>: View, BadgeContent {
  let label: Label
  let controlSize: ControlSize

  var body: some View {
    BadgeLayout(controlSize: controlSize) {
      label
    }
    .font(font)
    .foregroundStyle(.white)
    .background {
      Capsule(style: .circular).fill(.tint)
    }
  }
}

extension BadgeStyle where Self == FilledCapsuleBadgeStyle {
  public static var filledCapsule: FilledCapsuleBadgeStyle { FilledCapsuleBadgeStyle() }
}

// MARK: - TintedBadgeStyle

public struct TintedBadgeStyle: BadgeStyle {
  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    TintedBadgeContent(
      label: configuration.label,
      controlSize: configuration.controlSize
    )
  }
}

struct TintedBadgeContent<Label: View>: View, BadgeContent {
  let label: Label
  let controlSize: ControlSize

  var body: some View {
    BadgeLayout(controlSize: controlSize) {
      label
    }
    .font(font)
    .foregroundStyle(.tint)
    .background {
      RoundedRectangle(cornerRadius: cornerRadius)
        .fill(.tint.opacity(0.2))
    }
  }
}

extension BadgeStyle where Self == TintedBadgeStyle {
  public static var tinted: TintedBadgeStyle { TintedBadgeStyle() }
}

// MARK: - TintedCapsuleBadgeStyle

public struct TintedCapsuleBadgeStyle: BadgeStyle {
  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    TintedCapsuleBadgeContent(
      label: configuration.label,
      controlSize: configuration.controlSize
    )
  }
}

struct TintedCapsuleBadgeContent<Label: View>: View, BadgeContent {
  let label: Label
  let controlSize: ControlSize

  var body: some View {
    BadgeLayout(controlSize: controlSize) {
      label
    }
    .font(font)
    .foregroundStyle(.tint)
    .background {
      Capsule(style: .circular).fill(.tint.opacity(0.2))
    }
  }
}

extension BadgeStyle where Self == TintedCapsuleBadgeStyle {
  public static var tintedCapsule: TintedCapsuleBadgeStyle { TintedCapsuleBadgeStyle() }
}

// MARK: - AnyBadgeStyle

struct AnyBadgeStyle: BadgeStyle {
  private let body: (Configuration) -> AnyView

  init<S: BadgeStyle>(_ style: S) {
    self.body = { AnyView(style.makeBody(configuration: $0)) }
  }

  func makeBody(configuration: Configuration) -> some View {
    body(configuration)
  }
}

// MARK: - BadgeLayout

struct BadgeLayout: Layout {
  let padding: EdgeInsets

  init(controlSize: ControlSize) {
    switch controlSize {
    case .mini:
      padding = EdgeInsets(horizontal: 3, vertical: 1)
    case .small:
      padding = EdgeInsets(horizontal: 4, vertical: 2)
    case .large:
      padding = EdgeInsets(horizontal: 5, vertical: 3)
    case .extraLarge:
      padding = EdgeInsets(horizontal: 5, vertical: 3)
    default:
      padding = EdgeInsets(horizontal: 5, vertical: 3)
    }
  }

  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
    guard let subview = subviews.first else {
      return .zero
    }
    let fittingSize = subview.sizeThatFits(.unspecified)
    if fittingSize.width > fittingSize.height {
      return CGSize(
        width: fittingSize.width + padding.horizontal,
        height: fittingSize.height + padding.vertical
      )
    } else {
      return CGSize(
        width: fittingSize.height + padding.vertical,
        height: fittingSize.height + padding.vertical
      )
    }
  }

  func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
    guard let subview = subviews.first else {
      return
    }
    subview.place(at: bounds.center, anchor: .center, proposal: proposal)
  }
}

// MARK: - BadgeStyle Environment

struct BadgeStyleKey: EnvironmentKey {
  static var defaultValue: AnyBadgeStyle { AnyBadgeStyle(FilledBadgeStyle()) }
}

extension EnvironmentValues {
  var badgeStyle: AnyBadgeStyle {
    get { self[BadgeStyleKey.self] }
    set { self[BadgeStyleKey.self] = newValue }
  }
}

// MARK: - BadgeStyle Modifier

extension View {
  public func badgeStyle<S: BadgeStyle>(_ style: S) -> some View {
    environment(\.badgeStyle, AnyBadgeStyle(style))
  }
}

// MARK: - BadgeStyles Preview

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
  let badges: () -> some View = {
    ForEach(ControlSize.allCases, id: \.self) { controlSize in
      HStack {
        Badge("Badge")
          .controlSize(controlSize)
        Spacer()
        Text("\(controlSize)")
          .font(.fluid.caption)
      }
    }
  }
  return NavigationStack {
    List {
      Section {
        badges().badgeStyle(.filled)
      } header: {
        header(".filled")
      }
      .listRowSeparator(.hidden)

      Section {
        badges().badgeStyle(.filledCapsule)
      } header: {
        header(".filledCapsule")
      }
      .listRowSeparator(.hidden)

      Section {
        badges().badgeStyle(.tinted)
      } header: {
        header(".tinted")
      }
      .listRowSeparator(.hidden)

      Section {
        badges().badgeStyle(.tintedCapsule)
      } header: {
        header(".tinted")
      }
      .listRowSeparator(.hidden)
    }
    .navigationTitle("Badge Preview")
  }
}
