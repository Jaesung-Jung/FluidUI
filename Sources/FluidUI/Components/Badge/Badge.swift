//
//  Badge.swift
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

// MARK: - Badge

public struct Badge<Label: View>: View {
  @Environment(\.badgeStyle) var badgeStyle
  @Environment(\.controlSize) var controlSize

  let label: Label

  public init(@ViewBuilder label: () -> Label) {
    self.label = label()
  }

  public var body: some View {
    badgeStyle.makeBody(
      configuration: BadgeStyleConfiguration(
        label: BadgeStyleConfiguration.Label(content: label),
        controlSize: controlSize
      )
    )
  }
}

// MARK: - Badge<Text>

extension Badge where Label == Text {
  public init(_ titleKey: LocalizedStringKey) {
    self.init {
      Text(titleKey)
    }
  }

  public init<S: StringProtocol>(_ title: S) {
    self.init {
      Text(title)
    }
  }
}

extension Badge where Label == SwiftUI.Label<Text, Image> {
  public init(_ titleKey: LocalizedStringKey, image name: String) {
    self.init {
      SwiftUI.Label(titleKey, image: name)
    }
  }

  public init<S: StringProtocol>(_ title: S, image name: String) {
    self.init {
      SwiftUI.Label(title, image: name)
    }
  }

  public init(_ titleKey: LocalizedStringKey, systemImage name: String) {
    self.init {
      SwiftUI.Label(titleKey, systemImage: name)
    }
  }

  public init<S: StringProtocol>(_ title: S, systemImage name: String) {
    self.init {
      SwiftUI.Label(title, systemImage: name)
    }
  }

  @available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
  public init(_ titleKey: LocalizedStringKey, image resource: ImageResource) {
    self.init {
      SwiftUI.Label(titleKey, image: resource)
    }
  }

  @available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
  public init<S: StringProtocol>(_ title: S, image resource: ImageResource) {
    self.init {
      SwiftUI.Label(title, image: resource)
    }
  }
}

// MARK: - Badge Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  Badge {
    Text("Badge")
  }
  .controlSize(.large)
}
