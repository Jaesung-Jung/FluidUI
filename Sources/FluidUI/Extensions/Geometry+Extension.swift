//
//  Geometry+Extension.swift
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

// MARK: - UIEdgeInsets

extension UIEdgeInsets {
  @inlinable public var vertical: CGFloat { top + bottom }

  @inlinable public var horizontal: CGFloat { left + right }

  @inlinable public var negate: UIEdgeInsets {
    UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
  }

  public init(top: CGFloat) {
    self.init(top: top, left: 0, bottom: 0, right: 0)
  }

  public init(top: CGFloat, left: CGFloat) {
    self.init(top: top, left: left, bottom: 0, right: 0)
  }

  public init(top: CGFloat, bottom: CGFloat) {
    self.init(top: top, left: 0, bottom: bottom, right: 0)
  }

  public init(top: CGFloat, right: CGFloat) {
    self.init(top: top, left: 0, bottom: 0, right: right)
  }

  public init(top: CGFloat, left: CGFloat, bottom: CGFloat) {
    self.init(top: top, left: left, bottom: bottom, right: 0)
  }

  public init(top: CGFloat, left: CGFloat, right: CGFloat) {
    self.init(top: top, left: left, bottom: 0, right: right)
  }

  public init(left: CGFloat) {
    self.init(top: 0, left: left, bottom: 0, right: 0)
  }

  public init(left: CGFloat, bottom: CGFloat) {
    self.init(top: 0, left: left, bottom: bottom, right: 0)
  }

  public init(left: CGFloat, right: CGFloat) {
    self.init(top: 0, left: left, bottom: 0, right: right)
  }

  public init(left: CGFloat, bottom: CGFloat, right: CGFloat) {
    self.init(top: 0, left: left, bottom: bottom, right: right)
  }

  public init(bottom: CGFloat) {
    self.init(top: 0, left: 0, bottom: bottom, right: 0)
  }

  public init(bottom: CGFloat, right: CGFloat) {
    self.init(top: 0, left: 0, bottom: bottom, right: right)
  }

  public init(right: CGFloat) {
    self.init(top: 0, left: 0, bottom: 0, right: right)
  }

  public init(horizontal: CGFloat) {
    self.init(top: 0, left: horizontal, bottom: 0, right: horizontal)
  }

  public init(vertical: CGFloat) {
    self.init(top: vertical, left: 0, bottom: vertical, right: 0)
  }

  public init(horizontal: CGFloat, vertical: CGFloat) {
    self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
  }

  public init(_ inset: CGFloat) {
    self.init(top: inset, left: inset, bottom: inset, right: inset)
  }

  @inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
    self = rounded(rule)
  }

  @inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> UIEdgeInsets {
    UIEdgeInsets(
      top: top.rounded(rule),
      left: left.rounded(rule),
      bottom: bottom.rounded(rule),
      right: right.rounded(rule)
    )
  }

  @inlinable public mutating func append(_ insets: UIEdgeInsets) {
    self = appending(insets)
  }

  @inlinable public func appending(_ insets: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(
      top: top + insets.top,
      left: left + insets.left,
      bottom: bottom + insets.bottom,
      right: right + insets.right
    )
  }

  @inlinable public static func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
    lhs.appending(rhs)
  }

  @inlinable public mutating func subtract(_ insets: UIEdgeInsets) {
    self = subtracting(insets)
  }

  @inlinable public func subtracting(_ insets: UIEdgeInsets) -> UIEdgeInsets {
    UIEdgeInsets(
      top: top - insets.top,
      left: left - insets.left,
      bottom: bottom - insets.bottom,
      right: right - insets.right
    )
  }

  @inlinable public static func - (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
    lhs.subtracting(rhs)
  }

  @inlinable public mutating func multiply(_ factor: CGFloat) {
    self = multiplying(factor)
  }

  @inlinable public mutating func multiply(_ factor: Float) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public mutating func multiply(_ factor: Double) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public mutating func multiply(_ factor: Int) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: CGFloat) -> UIEdgeInsets {
    UIEdgeInsets(
      top: top * factor,
      left: left * factor,
      bottom: bottom * factor,
      right: right * factor
    )
  }

  @inlinable public func multiplying(_ factor: Float) -> UIEdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Double) -> UIEdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Int) -> UIEdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public static func * (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
    lhs.multiplying(rhs)
  }

  @inlinable public static func * (lhs: UIEdgeInsets, rhs: Float) -> UIEdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: UIEdgeInsets, rhs: Double) -> UIEdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: UIEdgeInsets, rhs: Int) -> UIEdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static prefix func - (insets: UIEdgeInsets) -> UIEdgeInsets { insets.negate }
}

// MARK: - NSDirectionalEdgeInsets

extension NSDirectionalEdgeInsets {
  @inlinable public var vertical: CGFloat { top + bottom }

  @inlinable public var horizontal: CGFloat { leading + trailing }

  @inlinable public var negate: NSDirectionalEdgeInsets {
    NSDirectionalEdgeInsets(top: -top, leading: -leading, bottom: -bottom, trailing: -trailing)
  }

  public init(top: CGFloat) {
    self.init(top: top, leading: 0, bottom: 0, trailing: 0)
  }

  public init(top: CGFloat, leading: CGFloat) {
    self.init(top: top, leading: leading, bottom: 0, trailing: 0)
  }

  public init(top: CGFloat, bottom: CGFloat) {
    self.init(top: top, leading: 0, bottom: bottom, trailing: 0)
  }

  public init(top: CGFloat, trailing: CGFloat) {
    self.init(top: top, leading: 0, bottom: 0, trailing: trailing)
  }

  public init(top: CGFloat, leading: CGFloat, bottom: CGFloat) {
    self.init(top: top, leading: leading, bottom: bottom, trailing: 0)
  }

  public init(top: CGFloat, leading: CGFloat, trailing: CGFloat) {
    self.init(top: top, leading: leading, bottom: 0, trailing: trailing)
  }

  public init(leading: CGFloat) {
    self.init(top: 0, leading: leading, bottom: 0, trailing: 0)
  }

  public init(leading: CGFloat, bottom: CGFloat) {
    self.init(top: 0, leading: leading, bottom: bottom, trailing: 0)
  }

  public init(leading: CGFloat, trailing: CGFloat) {
    self.init(top: 0, leading: leading, bottom: 0, trailing: trailing)
  }

  public init(leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
    self.init(top: 0, leading: leading, bottom: bottom, trailing: trailing)
  }

  public init(bottom: CGFloat) {
    self.init(top: 0, leading: 0, bottom: bottom, trailing: 0)
  }

  public init(bottom: CGFloat, trailing: CGFloat) {
    self.init(top: 0, leading: 0, bottom: bottom, trailing: trailing)
  }

  public init(trailing: CGFloat) {
    self.init(top: 0, leading: 0, bottom: 0, trailing: trailing)
  }

  public init(horizontal: CGFloat) {
    self.init(top: 0, leading: horizontal, bottom: 0, trailing: horizontal)
  }

  public init(vertical: CGFloat) {
    self.init(top: vertical, leading: 0, bottom: vertical, trailing: 0)
  }

  public init(horizontal: CGFloat, vertical: CGFloat) {
    self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
  }

  public init(_ inset: CGFloat) {
    self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
  }

  @inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
    self = rounded(rule)
  }

  @inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> NSDirectionalEdgeInsets {
    NSDirectionalEdgeInsets(
      top: top.rounded(rule),
      leading: leading.rounded(rule),
      bottom: bottom.rounded(rule),
      trailing: trailing.rounded(rule)
    )
  }

  @inlinable public mutating func append(_ insets: NSDirectionalEdgeInsets) {
    self = appending(insets)
  }

  @inlinable public func appending(_ insets: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
    NSDirectionalEdgeInsets(
      top: top + insets.top,
      leading: leading + insets.leading,
      bottom: bottom + insets.bottom,
      trailing: trailing + insets.trailing
    )
  }

  @inlinable public static func + (lhs: NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
    lhs.appending(rhs)
  }

  @inlinable public mutating func subtract(_ insets: NSDirectionalEdgeInsets) {
    self = subtracting(insets)
  }

  @inlinable public func subtracting(_ insets: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
    NSDirectionalEdgeInsets(
      top: top - insets.top,
      leading: leading - insets.leading,
      bottom: bottom - insets.bottom,
      trailing: trailing - insets.trailing
    )
  }

  @inlinable public static func - (lhs: NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
    lhs.subtracting(rhs)
  }

  @inlinable public mutating func multiply(_ factor: CGFloat) {
    self = multiplying(factor)
  }

  @inlinable public mutating func multiply(_ factor: Float) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public mutating func multiply(_ factor: Double) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public mutating func multiply(_ factor: Int) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: CGFloat) -> NSDirectionalEdgeInsets {
    NSDirectionalEdgeInsets(
      top: top * factor,
      leading: leading * factor,
      bottom: bottom * factor,
      trailing: trailing * factor
    )
  }

  @inlinable public func multiplying(_ factor: Float) -> NSDirectionalEdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Double) -> NSDirectionalEdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Int) -> NSDirectionalEdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public static func * (lhs: NSDirectionalEdgeInsets, rhs: CGFloat) -> NSDirectionalEdgeInsets {
    lhs.multiplying(rhs)
  }

  @inlinable public static func * (lhs: NSDirectionalEdgeInsets, rhs: Float) -> NSDirectionalEdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: NSDirectionalEdgeInsets, rhs: Double) -> NSDirectionalEdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: NSDirectionalEdgeInsets, rhs: Int) -> NSDirectionalEdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static prefix func - (insets: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets { insets.negate }
}

// MARK: - EdgeInsets

extension EdgeInsets {
  @inlinable public var vertical: CGFloat { top + bottom }

  @inlinable public var horizontal: CGFloat { leading + trailing }

  @inlinable public var negate: EdgeInsets {
    EdgeInsets(top: -top, leading: -leading, bottom: -bottom, trailing: -trailing)
  }

  public init(top: CGFloat) {
    self.init(top: top, leading: 0, bottom: 0, trailing: 0)
  }

  public init(top: CGFloat, leading: CGFloat) {
    self.init(top: top, leading: leading, bottom: 0, trailing: 0)
  }

  public init(top: CGFloat, bottom: CGFloat) {
    self.init(top: top, leading: 0, bottom: bottom, trailing: 0)
  }

  public init(top: CGFloat, trailing: CGFloat) {
    self.init(top: top, leading: 0, bottom: 0, trailing: trailing)
  }

  public init(top: CGFloat, leading: CGFloat, bottom: CGFloat) {
    self.init(top: top, leading: leading, bottom: bottom, trailing: 0)
  }

  public init(top: CGFloat, leading: CGFloat, trailing: CGFloat) {
    self.init(top: top, leading: leading, bottom: 0, trailing: trailing)
  }

  public init(leading: CGFloat) {
    self.init(top: 0, leading: leading, bottom: 0, trailing: 0)
  }

  public init(leading: CGFloat, bottom: CGFloat) {
    self.init(top: 0, leading: leading, bottom: bottom, trailing: 0)
  }

  public init(leading: CGFloat, trailing: CGFloat) {
    self.init(top: 0, leading: leading, bottom: 0, trailing: trailing)
  }

  public init(leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
    self.init(top: 0, leading: leading, bottom: bottom, trailing: trailing)
  }

  public init(bottom: CGFloat) {
    self.init(top: 0, leading: 0, bottom: bottom, trailing: 0)
  }

  public init(bottom: CGFloat, trailing: CGFloat) {
    self.init(top: 0, leading: 0, bottom: bottom, trailing: trailing)
  }

  public init(trailing: CGFloat) {
    self.init(top: 0, leading: 0, bottom: 0, trailing: trailing)
  }

  public init(horizontal: CGFloat) {
    self.init(top: 0, leading: horizontal, bottom: 0, trailing: horizontal)
  }

  public init(vertical: CGFloat) {
    self.init(top: vertical, leading: 0, bottom: vertical, trailing: 0)
  }

  public init(horizontal: CGFloat, vertical: CGFloat) {
    self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
  }

  public init(_ inset: CGFloat) {
    self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
  }

  @inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
    self = rounded(rule)
  }

  @inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> EdgeInsets {
    EdgeInsets(
      top: top.rounded(rule),
      leading: leading.rounded(rule),
      bottom: bottom.rounded(rule),
      trailing: trailing.rounded(rule)
    )
  }

  @inlinable public mutating func append(_ insets: EdgeInsets) {
    self = appending(insets)
  }

  @inlinable public func appending(_ insets: EdgeInsets) -> EdgeInsets {
    EdgeInsets(
      top: top + insets.top,
      leading: leading + insets.leading,
      bottom: bottom + insets.bottom,
      trailing: trailing + insets.trailing
    )
  }

  @inlinable public static func + (lhs: EdgeInsets, rhs: EdgeInsets) -> EdgeInsets {
    lhs.appending(rhs)
  }

  @inlinable public mutating func subtract(_ insets: EdgeInsets) {
    self = subtracting(insets)
  }

  @inlinable public func subtracting(_ insets: EdgeInsets) -> EdgeInsets {
    EdgeInsets(
      top: top - insets.top,
      leading: leading - insets.leading,
      bottom: bottom - insets.bottom,
      trailing: trailing - insets.trailing
    )
  }

  @inlinable public static func - (lhs: EdgeInsets, rhs: EdgeInsets) -> EdgeInsets {
    lhs.subtracting(rhs)
  }

  @inlinable public mutating func multiply(_ factor: CGFloat) {
    self = multiplying(factor)
  }

  @inlinable public mutating func multiply(_ factor: Float) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public mutating func multiply(_ factor: Double) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public mutating func multiply(_ factor: Int) {
    self = multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: CGFloat) -> EdgeInsets {
    EdgeInsets(
      top: top * factor,
      leading: leading * factor,
      bottom: bottom * factor,
      trailing: trailing * factor
    )
  }

  @inlinable public func multiplying(_ factor: Float) -> EdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Double) -> EdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Int) -> EdgeInsets {
    multiplying(CGFloat(factor))
  }

  @inlinable public static func * (lhs: EdgeInsets, rhs: CGFloat) -> EdgeInsets {
    lhs.multiplying(rhs)
  }

  @inlinable public static func * (lhs: EdgeInsets, rhs: Float) -> EdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: EdgeInsets, rhs: Double) -> EdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: EdgeInsets, rhs: Int) -> EdgeInsets {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static prefix func - (insets: EdgeInsets) -> EdgeInsets { insets.negate }
}

// MARK: - CGSize

extension CGSize {
  @inlinable public var negate: CGSize {
    CGSize(width: -width, height: -height)
  }

  @inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
    self = rounded(rule)
  }

  @inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> CGSize {
    CGSize(width: width.rounded(rule), height: height.rounded(rule))
  }

  @inlinable public func thatFits(_ bounds: CGRect) -> CGRect {
    let size = thatFits(bounds.size)
    return CGRect(
      x: bounds.midX - size.width * 0.5,
      y: bounds.midY - size.height * 0.5,
      width: size.width,
      height: size.height
    )
  }

  @inlinable public func thatFits(_ size: CGSize) -> CGSize {
    let ratio = min(size.width / width, size.height / height)
    return CGSize(width: width * ratio, height: height * ratio)
  }

  @inlinable public mutating func append(_ size: CGSize) {
    self = appending(size)
  }

  @inlinable public mutating func append(_ size: CGFloat) {
    self = appending(size)
  }

  @inlinable public mutating func append(width: CGFloat) {
    self = appending(width: width)
  }

  @inlinable public mutating func append(height: CGFloat) {
    self = appending(height: height)
  }

  @inlinable public func appending(_ size: CGSize) -> CGSize {
    CGSize(width: width + size.width, height: height + size.height)
  }

  @inlinable public func appending(_ size: CGFloat) -> CGSize {
    CGSize(width: width + size, height: height + size)
  }

  @inlinable public func appending(width w: CGFloat) -> CGSize {
    CGSize(width: width + w, height: height)
  }

  @inlinable public func appending(height h: CGFloat) -> CGSize {
    CGSize(width: width, height: height + h)
  }

  @inlinable public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
    lhs.appending(rhs)
  }

  @inlinable public mutating func subtract(_ size: CGSize) {
    self = subtracting(size)
  }

  @inlinable public mutating func subtract(_ size: CGFloat) {
    self = subtracting(size)
  }

  @inlinable public mutating func subtract(width: CGFloat) {
    self = subtracting(width: width)
  }

  @inlinable public mutating func subtract(height: CGFloat) {
    self = subtracting(height: height)
  }

  @inlinable public func subtracting(_ size: CGSize) -> CGSize {
    CGSize(width: width - size.width, height: height - size.height)
  }

  @inlinable public func subtracting(_ size: CGFloat) -> CGSize {
    CGSize(width: width - size, height: height - size)
  }

  @inlinable public func subtracting(width w: CGFloat) -> CGSize {
    CGSize(width: width - w, height: height)
  }

  @inlinable public func subtracting(height h: CGFloat) -> CGSize {
    CGSize(width: width, height: height - h)
  }

  @inlinable public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
    lhs.subtracting(rhs)
  }

  @inlinable public mutating func multiply(_ factor: CGFloat) {
    self = multiplying(factor)
  }

  @inlinable public func multiplying(_ factor: CGFloat) -> CGSize {
    CGSize(width: width * factor, height: height * factor)
  }

  @inlinable public func multiplying(_ factor: Float) -> CGSize {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Double) -> CGSize {
    multiplying(CGFloat(factor))
  }

  @inlinable public func multiplying(_ factor: Int) -> CGSize {
    multiplying(CGFloat(factor))
  }

  @inlinable public static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
    lhs.multiplying(rhs)
  }

  @inlinable public static func * (lhs: CGSize, rhs: Float) -> CGSize {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: CGSize, rhs: Double) -> CGSize {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static func * (lhs: CGSize, rhs: Int) -> CGSize {
    lhs.multiplying(CGFloat(rhs))
  }

  @inlinable public static prefix func - (size: CGSize) -> CGSize { size.negate }
}

// MARK: - CGPoint

extension CGPoint {
  @inlinable public var negate: CGPoint {
    CGPoint(x: -x, y: -y)
  }

  @inlinable public func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
    CGPoint(x: x + dx, y: y + dy)
  }

  @inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> CGPoint {
    CGPoint(x: x.rounded(rule), y: y.rounded(rule))
  }

  @inlinable static prefix func - (point: CGPoint) -> CGPoint { point.negate }
}

// MARK: - CGRect

extension CGRect {
  @inlinable public var topLeft: CGPoint { CGPoint(x: minX, y: minY) }

  @inlinable public var topCenter: CGPoint { CGPoint(x: midX, y: minY) }

  @inlinable public var topRight: CGPoint { CGPoint(x: maxX, y: minY) }

  @inlinable public var bottomLeft: CGPoint { CGPoint(x: minX, y: maxY) }

  @inlinable public var bottomCenter: CGPoint { CGPoint(x: midX, y: maxY) }

  @inlinable public var bottomRight: CGPoint { CGPoint(x: maxX, y: maxY) }

  @inlinable public var centerLeft: CGPoint { CGPoint(x: minX, y: midY) }

  @inlinable public var center: CGPoint { CGPoint(x: midX, y: midY) }

  @inlinable public var centerRight: CGPoint { CGPoint(x: maxX, y: midY) }

  public init(origin: CGPoint) {
    self.init(origin: origin, size: .zero)
  }

  public init(size: CGSize) {
    self.init(origin: .zero, size: size)
  }

  public init(x: CGFloat, y: CGFloat) {
    self.init(x: x, y: y, width: 0, height: 0)
  }

  public init(x: Double, y: Double) {
    self.init(x: x, y: y, width: 0, height: 0)
  }

  public init(x: Int, y: Int) {
    self.init(x: x, y: y, width: 0, height: 0)
  }

  public init(width: CGFloat, height: CGFloat) {
    self.init(x: 0, y: 0, width: width, height: height)
  }

  public init(width: Double, height: Double) {
    self.init(x: 0, y: 0, width: width, height: height)
  }

  public init(width: Int, height: Int) {
    self.init(x: 0, y: 0, width: width, height: height)
  }

  @inlinable public mutating func round(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) {
    self = rounded(rule)
  }

  @inlinable public func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> CGRect {
    CGRect(origin: origin.rounded(rule), size: size.rounded(rule))
  }
}

// MARK: - Metric

@MainActor
extension CGFloat {
  static let noIntrinsicMetric = UIView.noIntrinsicMetric
}

@MainActor
extension CGSize {
  static let noIntrinsicSize = CGSize(width: .noIntrinsicMetric, height: .noIntrinsicMetric)
  static let layoutFittingCompressedSize = UIView.layoutFittingCompressedSize
  static let layoutFittingExpandedSize = UIView.layoutFittingExpandedSize
}
