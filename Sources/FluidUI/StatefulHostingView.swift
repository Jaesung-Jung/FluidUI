//
//  StatefulHostingView.swift
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

// MARK: - StatefulHostingView

@MainActor public class StatefulHostingView<State>: UIView {
  let stateObject: StateObject
  var contentView: UIView! // swiftlint:disable:this implicitly_unwrapped_optional

  public var state: State {
    get { stateObject.state }
    set { stateObject.state = newValue }
  }

  public override var intrinsicContentSize: CGSize {
    contentView.intrinsicContentSize
  }

  public init<Content: View>(state: State, @ViewBuilder content: @escaping (State) -> Content) {
    self.stateObject = StateObject(state: state)
    super.init(frame: .zero)
    let invalidateSize: () -> Void = { [weak self] in
      self?.invalidateIntrinsicContentSize()
    }
    self.contentView = UIHostingConfiguration {
      HostingView.HostingLayout(invalidateSize: invalidateSize) {
        StatefulContentView(stateObject: stateObject, content: content)
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .ignoresSafeArea()
    }
    .margins(.all, 0)
    .makeContentView()

    addSubview(contentView)
  }

  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func layoutSubviews() {
    super.layoutSubviews()
    contentView.frame = bounds
  }
}

// MARK: - StatefulHostingView.StatefulContentView

extension StatefulHostingView {
  struct StatefulContentView<Content: View>: View {
    @ObservedObject var stateObject: StateObject

    let content: (State) -> Content

    var body: some View {
      content(stateObject.state)
    }
  }
}

// MARK: - StatefulHostingView.StateObject

extension StatefulHostingView {
  class StateObject: ObservableObject {
    @Published var state: State

    init(state: State) {
      self.state = state
    }
  }
}
