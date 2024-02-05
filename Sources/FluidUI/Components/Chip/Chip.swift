//
//  Chip.swift
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

// MARK: - Chip

public struct Chip: View {
  let content: Content

  public init(systemImage name: String) {
    self.content = Content(image: Image(systemName: name), text: nil)
  }

  public init(image name: String) {
    self.content = Content(image: Image(name), text: nil)
  }

  public init(text: LocalizedStringKey) {
    self.content = Content(image: nil, text: Text(text))
  }

  public init<S: StringProtocol>(text: S) {
    self.content = Content(image: nil, text: Text(text))
  }

  public init(systemImage name: String, text: LocalizedStringKey) {
    self.content = Content(image: Image(systemName: name), text: Text(text))
  }

  public init<S: StringProtocol>(systemImage name: String, text: S) {
    self.content = Content(image: Image(systemName: name), text: Text(text))
  }

  public init(image name: String, text: LocalizedStringKey) {
    self.content = Content(image: Image(name), text: Text(text))
  }

  public init<S: StringProtocol>(image name: String, text: S) {
    self.content = Content(image: Image(name), text: Text(text))
  }

  public var body: some View {
    content
  }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Chip {
  public init(image: ImageResource) {
    self.content = Content(image: Image(image), text: nil)
  }

  public init(image: ImageResource, text: LocalizedStringKey) {
    self.content = Content(image: Image(image), text: Text(text))
  }

  public init<S: StringProtocol>(image: ImageResource, text: S) {
    self.content = Content(image: Image(image), text: Text(text))
  }
}

// MARK: - Chip.Content

extension Chip {
  struct Content: View {
    @Environment(\.chipStyle) var chipStyle
    @Environment(\.controlSize) var controlSize

    let image: Image?
    let text: Text?

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

    var padding: EdgeInsets {
      switch controlSize {
      case .mini, .small:
        return EdgeInsets(horizontal: 8, vertical: 4)
      case .large, .extraLarge:
        return EdgeInsets(horizontal: 10, vertical: 6)
      default:
        return EdgeInsets(horizontal: 9, vertical: 5)
      }
    }

    var label: some View {
      ChipLayout {
        HStack(spacing: 4) {
          image?.renderingMode(.template)
          text?.transition(.opacity)
        }
        .font(font)
        .padding(padding)
      }
    }

    var body: some View {
      chipStyle.makeBody(
        configuration: ChipStyleConfiguration(label: ChipStyleConfiguration.Label(content: AnyView(label)))
      )
    }
  }
}

// MARK: - Chip.ChipLayout

extension Chip {
  struct ChipLayout: Layout {
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
      guard let content = subviews.first else {
        return
      }
      content.place(at: bounds.center, anchor: .center, proposal: ProposedViewSize(bounds.size))
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
      guard let size = subviews.first?.sizeThatFits(proposal) else {
        return .zero
      }
      return CGSize(width: max(size.width, size.height), height: size.height)
    }
  }
}

// MARK: - Chip Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  VStack(spacing: 40) {
    VStack {
      Text("Filled Style")
      Chip(systemImage: "swift", text: "Chip")
        .controlSize(.large)
      Chip(systemImage: "swift", text: "Chip")
      Chip(systemImage: "swift", text: "Chip")
        .controlSize(.small)
    }

    VStack {
      Text("Tinted Style")
      Chip(systemImage: "swift", text: "Chip")
        .controlSize(.large)
      Chip(systemImage: "swift", text: "Chip")
      Chip(systemImage: "swift", text: "Chip")
        .controlSize(.small)
    }
    .chipStyle(.tinted)

    VStack {
      Text("Bordered Style")
      Chip(systemImage: "swift", text: "Chip")
        .controlSize(.large)
      Chip(systemImage: "swift", text: "Chip")
      Chip(systemImage: "swift", text: "Chip")
        .controlSize(.small)
    }
    .chipStyle(.bordered)
  }
  .font(.fluid.body)
}
