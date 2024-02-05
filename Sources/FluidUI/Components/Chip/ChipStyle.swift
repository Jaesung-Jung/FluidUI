//
//  ChipStyle.swift
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

// MARK: - ChipStyle

public protocol ChipStyle {
  associatedtype Body: View
  typealias Configuration = ChipStyleConfiguration

  @ViewBuilder func makeBody(configuration: Configuration) -> Self.Body
}

// MARK: - ChipStyleConfiguration

public struct ChipStyleConfiguration {
  public struct Label: View {
    let content: AnyView

    public var body: some View { content }
  }

  public let label: Label
}

// MARK: - FilledChipStyle

public struct FilledChipStyle: ChipStyle {
  @Environment(\.controlSize) var controlSize

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundStyle(.white)
      .background {
        Capsule().fill(.tint)
      }
  }
}

extension ChipStyle where Self == FilledChipStyle {
  public static var filled: FilledChipStyle { FilledChipStyle() }
}

// MARK: - TintedChipStyle

public struct TintedChipStyle: ChipStyle {
  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundStyle(.tint)
      .background {
        Capsule().fill(.tint).opacity(0.2)
      }
  }
}

extension ChipStyle where Self == TintedChipStyle {
  public static var tinted: TintedChipStyle { TintedChipStyle() }
}

// MARK: - BorderedChipStyle

public struct BorderedChipStyle: ChipStyle {
  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundStyle(.tint)
      .background {
        Capsule().strokeBorder(.tint, lineWidth: 1)
      }
  }
}

extension ChipStyle where Self == BorderedChipStyle {
  public static var bordered: BorderedChipStyle { BorderedChipStyle() }
}

// MARK: - ChipStyle (Environment)

struct AnyChipStyle: ChipStyle {
  let makeBody: (Configuration) -> AnyView

  init<S: ChipStyle>(_ style: S) {
    makeBody = {
      AnyView(style.makeBody(configuration: $0))
    }
  }

  func makeBody(configuration: Configuration) -> some View {
    makeBody(configuration)
  }
}

struct ChipStyleKey: EnvironmentKey {
  static var defaultValue: AnyChipStyle = AnyChipStyle(FilledChipStyle())
}

extension EnvironmentValues {
  var chipStyle: AnyChipStyle {
    get { self[ChipStyleKey.self] }
    set { self[ChipStyleKey.self] = newValue }
  }
}

extension View {
  func chipStyle<S: ChipStyle>(_ style: S) -> some View {
    environment(\.chipStyle, AnyChipStyle(style))
  }
}
