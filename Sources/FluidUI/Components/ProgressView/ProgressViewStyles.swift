//
//  ProgressViewStyles.swift
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

// MARK: - CircleFade Style

public struct FluidCircleFadeProgressViewStyle: ProgressViewStyle {
  @Environment(\.controlSize) var controlSize

  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    FluidCircleFadeProgressViewContent(
      label: configuration.label,
      controlSize: controlSize
    )
  }
}

struct FluidCircleFadeProgressViewContent<Label: View>: View {
  let label: Label
  let controlSize: ControlSize

  var body: some View {
    VStack {
      FluidCircleProgressContent(controlSize: controlSize) { circle, flag in
        AnyView(
          circle
            .opacity(flag ? 0.5 : 1)
        )
      }

      label
        .font(controlSize.font)
    }
    .foregroundStyle(.fluid.gray3)
  }
}

// MARK: - CircleScale Style

public struct FluidCircleScaleProgressViewStyle: ProgressViewStyle {
  @Environment(\.controlSize) var controlSize

  public init() {
  }

  public func makeBody(configuration: Configuration) -> some View {
    FluidCircleScaleProgressContent(
      label: configuration.label,
      controlSize: controlSize
    )
  }
}

struct FluidCircleScaleProgressContent<Label: View>: View {
  let label: Label
  let controlSize: ControlSize

  var body: some View {
    VStack {
      FluidCircleProgressContent(controlSize: controlSize) { circle, flag in
        AnyView(
          circle
            .opacity(flag ? 0.5 : 1)
            .scaleEffect(flag ? CGSize(width: 0.5, height: 0.5) : CGSize(width: 1, height: 1))
        )
      }

      label
        .font(controlSize.font)
    }
    .foregroundStyle(.fluid.gray3)
  }
}

// MARK: - FluidCircleProgressContent

struct FluidCircleProgressContent: View {
  let size: CGFloat
  let modifier: (Circle, Bool) -> AnyView
  let animation = Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)

  init(controlSize: ControlSize, modifier: @escaping (Circle, Bool) -> AnyView) {
    switch controlSize {
    case .mini:
      size = 6
    case .small:
      size = 8
    case .large:
      size = 16
    case .extraLarge:
      size = 20
    default:
      size = 12
    }
    self.modifier = modifier
  }

  var body: some View {
    HStack(spacing: size / 2) {
      CircleItem(size: size, animation: animation, modifier: modifier)
      CircleItem(size: size, animation: animation.delay(0.2), modifier: modifier)
      CircleItem(size: size, animation: animation.delay(0.4), modifier: modifier)
    }
  }

  struct CircleItem: View {
    @State var flag = true

    let size: CGFloat
    let animation: Animation
    let modifier: (Circle, Bool) -> AnyView

    var body: some View {
      modifier(Circle(), flag)
        .frame(width: size, height: size)
        .onAppear {
          withAnimation(animation) {
            flag.toggle()
          }
        }
    }
  }
}

//extension FluidCircle

// MARK: - ProgressViewStyle (Fluid)

extension ProgressViewStyle where Self == FluidCircleFadeProgressViewStyle {
  public static var fluid: FluidProgressViewStyles.Type { FluidProgressViewStyles.self }
}

public struct FluidProgressViewStyles {
  public static var circleFade: FluidCircleFadeProgressViewStyle { FluidCircleFadeProgressViewStyle() }
  public static var circleScale: FluidCircleScaleProgressViewStyle { FluidCircleScaleProgressViewStyle() }
}

// MARK: - ProgressViewStyles Preview

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
  let progressViews: () -> some View = {
    ForEach(ControlSize.allCases, id: \.self) { controlSize in
      HStack {
        ProgressView()
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
        progressViews().progressViewStyle(.fluid.circleFade)
      } header: {
        header(".fluid.circleFade")
      }
      .listRowSeparator(.hidden)

      Section {
        progressViews().progressViewStyle(.fluid.circleScale)
      } header: {
        header(".fluid.circleScale")
      }
      .listRowSeparator(.hidden)
    }
    .navigationTitle("ProgressView Preview")
  }
}
