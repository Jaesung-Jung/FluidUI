//
//  GeometryExtensionTests.swift
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

import XCTest
import SwiftUI
@testable import FluidUI

// MARK: - GeometryExtensionTests (UIEdgeInsets)

final class GeometryExtensionTests: XCTestCase {
  func testUIEdgeInsetsInitWithTop() {
    let insets = UIEdgeInsets(top: 10)
    XCTAssertEqual(insets, UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
  }

  func testUIEdgeInsetsInitWithTopLeft() {
    let insets = UIEdgeInsets(top: 10, left: 8)
    XCTAssertEqual(insets, UIEdgeInsets(top: 10, left: 8, bottom: 0, right: 0))
  }

  func testUIEdgeInsetsInitWithTopBottom() {
    let insets = UIEdgeInsets(top: 10, bottom: 8)
    XCTAssertEqual(insets, UIEdgeInsets(top: 10, left: 0, bottom: 8, right: 0))
  }

  func testUIEdgeInsetsInitWithTopRight() {
    let insets = UIEdgeInsets(top: 10, right: 8)
    XCTAssertEqual(insets, UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 8))
  }

  func testUIEdgeInsetsInitWithTopLeftBottom() {
    let insets = UIEdgeInsets(top: 10, left: 8, bottom: 6)
    XCTAssertEqual(insets, UIEdgeInsets(top: 10, left: 8, bottom: 6, right: 0))
  }

  func testUIEdgeInsetsInitWithTopLeftRight() {
    let insets = UIEdgeInsets(top: 10, left: 8, right: 6)
    XCTAssertEqual(insets, UIEdgeInsets(top: 10, left: 8, bottom: 0, right: 6))
  }

  func testUIEdgeInsetsInitWithLeft() {
    let insets = UIEdgeInsets(left: 10)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
  }

  func testUIEdgeInsetsInitWithLeftBottom() {
    let insets = UIEdgeInsets(left: 10, bottom: 8)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 10, bottom: 8, right: 0))
  }

  func testUIEdgeInsetsInitWithLeftRight() {
    let insets = UIEdgeInsets(left: 10, right: 8)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 8))
  }

  func testUIEdgeInsetsInitWithLeftBottomRight() {
    let insets = UIEdgeInsets(left: 10, bottom: 8, right: 6)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 10, bottom: 8, right: 6))
  }

  func testUIEdgeInsetsInitWithBottom() {
    let insets = UIEdgeInsets(bottom: 10)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
  }

  func testUIEdgeInsetsInitWithBottomRight() {
    let insets = UIEdgeInsets(bottom: 10, right: 8)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 8))
  }

  func testUIEdgeInsetsInitWithRight() {
    let insets = UIEdgeInsets(right: 10)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
  }

  func testUIEdgeInsetsInitWithHorizontal() {
    let insets = UIEdgeInsets(horizontal: 10)
    XCTAssertEqual(insets, UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
  }

  func testUIEdgeInsetsInitWithVertical() {
    let insets = UIEdgeInsets(vertical: 10)
    XCTAssertEqual(insets, UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
  }

  func testUIEdgeInsetsInitWithHorizontalVertical() {
    let insets = UIEdgeInsets(horizontal: 10, vertical: 8)
    XCTAssertEqual(insets, UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
  }

  func testUIEdgeInsetsHorizontal() {
    let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    XCTAssertEqual(insets.horizontal, 6)
  }

  func testUIEdgeInsetsVertical() {
    let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    XCTAssertEqual(insets.vertical, 4)
  }

  func testUIEdgeInsetsRounded() {
    let insets = UIEdgeInsets(
      top: 5.8,
      left: 5.5,
      bottom: 5.4,
      right: 5.1
    )
    XCTAssertEqual(insets.rounded(), UIEdgeInsets(top: 6, left: 6, bottom: 5, right: 5))
  }

  func testUIEdgeInsetsAppending() {
    let insets1 = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    let insets2 = UIEdgeInsets(top: 2, left: 3, bottom: 4, right: 5)
    XCTAssertEqual(insets1.appending(insets2), UIEdgeInsets(top: 3, left: 5, bottom: 7, right: 9))
  }

  func testUIEdgeInsetsSubtracting() {
    let insets1 = UIEdgeInsets(top: 2, left: 3, bottom: 4, right: 5)
    let insets2 = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    XCTAssertEqual(insets1.subtracting(insets2), UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
  }

  func testUIEdgeInsetsMultiplying() {
    let insets = UIEdgeInsets(top: 2, left: 3, bottom: 4, right: 5)
    XCTAssertEqual(insets.multiplying(2), UIEdgeInsets(top: 4, left: 6, bottom: 8, right: 10))
  }

  func testUIEdgeInsetsNegate() {
    let insets = UIEdgeInsets(top: 1, left: 2, bottom: -3, right: -4)
    XCTAssertEqual(insets.negate, UIEdgeInsets(top: -1, left: -2, bottom: 3, right: 4))
  }
}

// MARK: - GeometryExtensionTests (NSDirectionalEdgeInsets)

extension GeometryExtensionTests {
  func testNSDirectionalEdgeInsetsInitWithTop() {
    let insets = NSDirectionalEdgeInsets(top: 10)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithTopLeft() {
    let insets = NSDirectionalEdgeInsets(top: 10, leading: 8)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 0, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithTopBottom() {
    let insets = NSDirectionalEdgeInsets(top: 10, bottom: 8)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 8, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithToptrailing() {
    let insets = NSDirectionalEdgeInsets(top: 10, trailing: 8)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 8))
  }

  func testNSDirectionalEdgeInsetsInitWithTopleadingBottom() {
    let insets = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 6)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 6, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithTopleadingtrailing() {
    let insets = NSDirectionalEdgeInsets(top: 10, leading: 8, trailing: 6)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 0, trailing: 6))
  }

  func testNSDirectionalEdgeInsetsInitWithleading() {
    let insets = NSDirectionalEdgeInsets(leading: 10)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithleadingBottom() {
    let insets = NSDirectionalEdgeInsets(leading: 10, bottom: 8)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithleadingtrailing() {
    let insets = NSDirectionalEdgeInsets(leading: 10, trailing: 8)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 8))
  }

  func testNSDirectionalEdgeInsetsInitWithleadingBottomtrailing() {
    let insets = NSDirectionalEdgeInsets(leading: 10, bottom: 8, trailing: 6)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 6))
  }

  func testNSDirectionalEdgeInsetsInitWithBottom() {
    let insets = NSDirectionalEdgeInsets(bottom: 10)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithBottomtrailing() {
    let insets = NSDirectionalEdgeInsets(bottom: 10, trailing: 8)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 8))
  }

  func testNSDirectionalEdgeInsetsInitWithtrailing() {
    let insets = NSDirectionalEdgeInsets(trailing: 10)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
  }

  func testNSDirectionalEdgeInsetsInitWithHorizontal() {
    let insets = NSDirectionalEdgeInsets(horizontal: 10)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
  }

  func testNSDirectionalEdgeInsetsInitWithVertical() {
    let insets = NSDirectionalEdgeInsets(vertical: 10)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
  }

  func testNSDirectionalEdgeInsetsInitWithHorizontalVertical() {
    let insets = NSDirectionalEdgeInsets(horizontal: 10, vertical: 8)
    XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
  }

  func testNSDirectionalEdgeInsetsHorizontal() {
    let insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    XCTAssertEqual(insets.horizontal, 6)
  }

  func testNSDirectionalEdgeInsetsVertical() {
    let insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    XCTAssertEqual(insets.vertical, 4)
  }

  func testNSDirectionalEdgeInsetsRounded() {
    let insets = NSDirectionalEdgeInsets(
      top: 5.8,
      leading: 5.5,
      bottom: 5.4,
      trailing: 5.1
    )
    XCTAssertEqual(insets.rounded(), NSDirectionalEdgeInsets(top: 6, leading: 6, bottom: 5, trailing: 5))
  }

  func testNSDirectionalEdgeInsetsAppending() {
    let insets1 = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    let insets2 = NSDirectionalEdgeInsets(top: 2, leading: 3, bottom: 4, trailing: 5)
    XCTAssertEqual(insets1.appending(insets2), NSDirectionalEdgeInsets(top: 3, leading: 5, bottom: 7, trailing: 9))
  }

  func testNSDirectionalEdgeInsetsSubtracting() {
    let insets1 = NSDirectionalEdgeInsets(top: 2, leading: 3, bottom: 4, trailing: 5)
    let insets2 = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    XCTAssertEqual(insets1.subtracting(insets2), NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1))
  }

  func testNSDirectionalEdgeInsetsMultiplying() {
    let insets = NSDirectionalEdgeInsets(top: 2, leading: 3, bottom: 4, trailing: 5)
    XCTAssertEqual(insets.multiplying(2), NSDirectionalEdgeInsets(top: 4, leading: 6, bottom: 8, trailing: 10))
  }

  func testNSDirectionalEdgeInsetsNegate() {
    let insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: -3, trailing: -4)
    XCTAssertEqual(insets.negate, NSDirectionalEdgeInsets(top: -1, leading: -2, bottom: 3, trailing: 4))
  }
}

// MARK: - GeometryExtensionTests (EdgeInsets)

extension GeometryExtensionTests {
  func testEdgeInsetsInitWithTop() {
    let insets = EdgeInsets(top: 10)
    XCTAssertEqual(insets, EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
  }

  func testEdgeInsetsInitWithTopLeft() {
    let insets = EdgeInsets(top: 10, leading: 8)
    XCTAssertEqual(insets, EdgeInsets(top: 10, leading: 8, bottom: 0, trailing: 0))
  }

  func testEdgeInsetsInitWithTopBottom() {
    let insets = EdgeInsets(top: 10, bottom: 8)
    XCTAssertEqual(insets, EdgeInsets(top: 10, leading: 0, bottom: 8, trailing: 0))
  }

  func testEdgeInsetsInitWithToptrailing() {
    let insets = EdgeInsets(top: 10, trailing: 8)
    XCTAssertEqual(insets, EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 8))
  }

  func testEdgeInsetsInitWithTopleadingBottom() {
    let insets = EdgeInsets(top: 10, leading: 8, bottom: 6)
    XCTAssertEqual(insets, EdgeInsets(top: 10, leading: 8, bottom: 6, trailing: 0))
  }

  func testEdgeInsetsInitWithTopleadingtrailing() {
    let insets = EdgeInsets(top: 10, leading: 8, trailing: 6)
    XCTAssertEqual(insets, EdgeInsets(top: 10, leading: 8, bottom: 0, trailing: 6))
  }

  func testEdgeInsetsInitWithleading() {
    let insets = EdgeInsets(leading: 10)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
  }

  func testEdgeInsetsInitWithleadingBottom() {
    let insets = EdgeInsets(leading: 10, bottom: 8)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
  }

  func testEdgeInsetsInitWithleadingtrailing() {
    let insets = EdgeInsets(leading: 10, trailing: 8)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 8))
  }

  func testEdgeInsetsInitWithleadingBottomtrailing() {
    let insets = EdgeInsets(leading: 10, bottom: 8, trailing: 6)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 6))
  }

  func testEdgeInsetsInitWithBottom() {
    let insets = EdgeInsets(bottom: 10)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
  }

  func testEdgeInsetsInitWithBottomtrailing() {
    let insets = EdgeInsets(bottom: 10, trailing: 8)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 8))
  }

  func testEdgeInsetsInitWithtrailing() {
    let insets = EdgeInsets(trailing: 10)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
  }

  func testEdgeInsetsInitWithHorizontal() {
    let insets = EdgeInsets(horizontal: 10)
    XCTAssertEqual(insets, EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
  }

  func testEdgeInsetsInitWithVertical() {
    let insets = EdgeInsets(vertical: 10)
    XCTAssertEqual(insets, EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
  }

  func testEdgeInsetsInitWithHorizontalVertical() {
    let insets = EdgeInsets(horizontal: 10, vertical: 8)
    XCTAssertEqual(insets, EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
  }

  func testEdgeInsetsHorizontal() {
    let insets = EdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    XCTAssertEqual(insets.horizontal, 6)
  }

  func testEdgeInsetsVertical() {
    let insets = EdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    XCTAssertEqual(insets.vertical, 4)
  }

  func testEdgeInsetsRounded() {
    let insets = EdgeInsets(
      top: 5.8,
      leading: 5.5,
      bottom: 5.4,
      trailing: 5.1
    )
    XCTAssertEqual(insets.rounded(), EdgeInsets(top: 6, leading: 6, bottom: 5, trailing: 5))
  }

  func testEdgeInsetsAppending() {
    let insets1 = EdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    let insets2 = EdgeInsets(top: 2, leading: 3, bottom: 4, trailing: 5)
    XCTAssertEqual(insets1.appending(insets2), EdgeInsets(top: 3, leading: 5, bottom: 7, trailing: 9))
  }

  func testEdgeInsetsSubtracting() {
    let insets1 = EdgeInsets(top: 2, leading: 3, bottom: 4, trailing: 5)
    let insets2 = EdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    XCTAssertEqual(insets1.subtracting(insets2), EdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1))
  }

  func testEdgeInsetsMultiplying() {
    let insets = EdgeInsets(top: 2, leading: 3, bottom: 4, trailing: 5)
    XCTAssertEqual(insets * 2, EdgeInsets(top: 4, leading: 6, bottom: 8, trailing: 10))
  }

  func testEdgeInsetsNegate() {
    let insets = EdgeInsets(top: 1, leading: 2, bottom: -3, trailing: -4)
    XCTAssertEqual(insets.negate, EdgeInsets(top: -1, leading: -2, bottom: 3, trailing: 4))
  }
}

// MARK: - GeometryExtensionTests (CGSize)

extension GeometryExtensionTests {
  func testCGSizeRounded() {
    let size = CGSize(width: 10.5, height: 10.4)
    XCTAssertEqual(size.rounded(), CGSize(width: 11, height: 10))
  }

  func testCGSizeThatFits() {
    let size = CGSize(width: 200, height: 100)
    let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
    XCTAssertEqual(size.thatFits(bounds), CGRect(x: 0, y: 25, width: 100, height: 50))
  }

  func testCGSizeAppendingWithSize() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.appending(CGSize(width: 20, height: 10)), CGSize(width: 220, height: 110))
  }

  func testCGSizeAppendingWithSizeValue() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.appending(20), CGSize(width: 220, height: 120))
  }

  func testCGSizeAppendingWithWidth() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.appending(width: 20), CGSize(width: 220, height: 100))
  }

  func testCGSizeAppendingWithHeight() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.appending(height: 20), CGSize(width: 200, height: 120))
  }

  func testCGSizeSubtractingWithSize() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.subtracting(CGSize(width: 20, height: 10)), CGSize(width: 180, height: 90))
  }

  func testCGSizeSubtractingWithSizeValue() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.subtracting(20), CGSize(width: 180, height: 80))
  }

  func testCGSizeSubtractingWithWidth() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.subtracting(width: 20), CGSize(width: 180, height: 100))
  }

  func testCGSizeSubtractingWithHeight() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.subtracting(height: 20), CGSize(width: 200, height: 80))
  }

  func testCGSizeMultiplying() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.multiplying(2), CGSize(width: 400, height: 200))
  }

  func testCGSizeNegate() {
    let size = CGSize(width: 200, height: 100)
    XCTAssertEqual(size.negate, CGSize(width: -200, height: -100))
  }
}

// MARK: - GeometryExtensionTests (CGPoint)

extension GeometryExtensionTests {
  func testCGPointOffsetBy() {
    let point = CGPoint(x: 20, y: 40)
    XCTAssertEqual(point.offsetBy(dx: 10, dy: 5), CGPoint(x: 30, y: 45))
  }

  func testCGPointNegate() {
    let point = CGPoint(x: 20, y: 40)
    XCTAssertEqual(point.negate, CGPoint(x: -20, y: -40))
  }
}

extension GeometryExtensionTests {
  func testCGRectTopLeft() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.topLeft, CGPoint(x: 10, y: 5))
  }

  func testCGRectTopCenter() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.topCenter, CGPoint(x: 60, y: 5))
  }

  func testCGRectTopRight() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.topRight, CGPoint(x: 110, y: 5))
  }

  func testCGRectbottomLeft() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.bottomLeft, CGPoint(x: 10, y: 55))
  }

  func testCGRectBottomCenter() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.bottomCenter, CGPoint(x: 60, y: 55))
  }

  func testCGRectBottomRight() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.bottomRight, CGPoint(x: 110, y: 55))
  }

  func testCGRectCenterLeft() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.centerLeft, CGPoint(x: 10, y: 30))
  }

  func testCGRectCenterRight() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.centerRight, CGPoint(x: 110, y: 30))
  }

  func testCGRectCenter() {
    let rect = CGRect(x: 10, y: 5, width: 100, height: 50)
    XCTAssertEqual(rect.center, CGPoint(x: 60, y: 30))
  }

  func testCGRectInitWithOrigin() {
    let rect = CGRect(origin: CGPoint(x: 10, y: 5))
    XCTAssertEqual(rect, CGRect(x: 10, y: 5, width: 0, height: 0))
  }

  func testCGRectInitWithSize() {
    let rect = CGRect(size: CGSize(width: 100, height: 50))
    XCTAssertEqual(rect, CGRect(x: 0, y: 0, width: 100, height: 50))
  }

  func testCGRectInitWithXY() {
    let rect = CGRect(x: 10, y: 5)
    XCTAssertEqual(rect, CGRect(x: 10, y: 5, width: 0, height: 0))
  }

  func testCGRectInitWithWidthAndHeight() {
    let rect = CGRect(width: 100, height: 50)
    XCTAssertEqual(rect, CGRect(x: 0, y: 0, width: 100, height: 50))
  }

  func testCGRectRounded() {
    let rect = CGRect(x: 10.5, y: 5.4, width: 100.5, height: 50.4)
    XCTAssertEqual(rect.rounded(), CGRect(x: 11, y: 5, width: 101, height: 50))
  }
}
