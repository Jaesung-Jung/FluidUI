//
//  FUTextBoxStyles.swift
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

import UIKit

// MARK: - TextFieldContentView

protocol TextFieldContentView: UIView {
  var textField: UITextField { get }
  var placeholderLabel: UILabel { get }
}

extension TextFieldContentView {
  func animator() -> UIViewPropertyAnimator {
    let spring = UISpringTimingParameters(
      mass: 1,
      stiffness: 438.6490844928604,
      damping: 41.88790204786391,
      initialVelocity: .zero
    )
    return UIViewPropertyAnimator(duration: 0, timingParameters: spring)
  }
}

// MARK: - PlainTextFieldContentView

class PlainTextFieldContentView: UIView, TextFieldContentView {
  let textField: UITextField
  let placeholderLabel: UILabel

  override var intrinsicContentSize: CGSize {
    textField.intrinsicContentSize
  }

  init(textField: UITextField, placeholderLabel: UILabel) {
    self.textField = textField
    self.placeholderLabel = placeholderLabel
    super.init(frame: .zero)
    addSubview(placeholderLabel)
    addSubview(textField)
    placeholderLabel.textColor = .fluid.placeholder
    textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    textField.frame = bounds
    placeholderLabel.frame = bounds
  }

  @objc func editingChanged(_ textField: UITextField) {
    placeholderLabel.isHidden = textField.text.map { !$0.isEmpty } ?? false
  }
}

// MARK: - UnderlineTextFieldContentView

class UnderlineTextFieldContentView: UIView, TextFieldContentView {
  let textField: UITextField
  let placeholderLabel: UILabel
  let divider = UIView()
  let highlightedDivider = UIView()
  let spacing: CGFloat = 8

  override var intrinsicContentSize: CGSize {
    let textFieldSize = textField.intrinsicContentSize
    return CGSize(
      width: textFieldSize.width,
      height: textFieldSize.height + spacing + 1
    )
  }

  init(textField: UITextField, placeholderLabel: UILabel) {
    self.textField = textField
    self.placeholderLabel = placeholderLabel
    super.init(frame: .zero)

    placeholderLabel.textColor = .fluid.placeholder
    addSubview(placeholderLabel)

    textField.addTarget(self, action: #selector(editingDidBegin(_:)), for: .editingDidBegin)
    textField.addTarget(self, action: #selector(editingDidEnd(_:)), for: .editingDidEnd)
    textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    addSubview(textField)

    addSubview(divider)
    addSubview(highlightedDivider)
    divider.backgroundColor = .fluid.placeholder
    highlightedDivider.backgroundColor = tintColor
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    textField.frame = CGRect(
      x: bounds.minX,
      y: bounds.minY,
      width: bounds.width,
      height: textField.intrinsicContentSize.height
    )
    placeholderLabel.frame = textField.frame

    divider.frame = CGRect(
      x: bounds.minX,
      y: bounds.maxY - 1,
      width: bounds.width,
      height: 1
    )
    highlightedDivider.frame = dividerRect(isEditing: textField.isEditing)
  }

  override func tintColorDidChange() {
    super.tintColorDidChange()
    highlightedDivider.backgroundColor = tintColor
  }

  func dividerRect(isEditing: Bool) -> CGRect {
    if isEditing {
      return CGRect(
        x: divider.frame.minX,
        y: divider.frame.minY - 1,
        width: divider.frame.width,
        height: 2
      )
    } else {
      return CGRect(
        x: divider.frame.midX,
        y: divider.frame.minY - 1,
        width: 0,
        height: 2
      )
    }
  }

  @objc func editingDidBegin(_ textField: UITextField) {
    let finalRect = dividerRect(isEditing: true)
    let animator = animator()
    animator.addAnimations {
      self.highlightedDivider.frame = finalRect
    }
    animator.startAnimation()
  }

  @objc func editingDidEnd(_ textField: UITextField) {
    let finalRect = dividerRect(isEditing: false)
    let animator = animator()
    animator.addAnimations {
      self.highlightedDivider.frame = finalRect
    }
    animator.startAnimation()
  }

  @objc func editingChanged(_ textField: UITextField) {
    placeholderLabel.isHidden = textField.text.map { !$0.isEmpty } ?? false
  }
}

// MARK: - BorderedTextFieldContentView

class BorderedTextFieldContentView: UIView, TextFieldContentView {
  let textField: UITextField
  let placeholderLabel: UILabel
  let highligtedBackground = UIView()

  override var intrinsicContentSize: CGSize {
    let textFieldSize = textField.intrinsicContentSize
    return CGSize(
      width: textFieldSize.width + 20,
      height: textFieldSize.height + 20
    )
  }

  init(textField: UITextField, placeholderLabel: UILabel) {
    self.textField = textField
    self.placeholderLabel = placeholderLabel
    super.init(frame: .zero)

    traitCollection.performAsCurrent {
      layer.borderColor = .fluid.placeholder
    }
    layer.borderWidth = 1
    layer.cornerRadius = 8
    layer.cornerCurve = .continuous

    traitCollection.performAsCurrent {
      highligtedBackground.layer.borderColor = tintColor.cgColor
    }
    highligtedBackground.layer.borderWidth = 2
    highligtedBackground.layer.cornerRadius = 8
    highligtedBackground.layer.cornerCurve = .continuous
    highligtedBackground.alpha = 0
    addSubview(highligtedBackground)

    placeholderLabel.textColor = .fluid.placeholder
    addSubview(placeholderLabel)

    textField.addTarget(self, action: #selector(editingDidBegin(_:)), for: .editingDidBegin)
    textField.addTarget(self, action: #selector(editingDidEnd(_:)), for: .editingDidEnd)
    textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    addSubview(textField)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func tintColorDidChange() {
    super.tintColorDidChange()
    traitCollection.performAsCurrent {
      highligtedBackground.layer.borderColor = tintColor.cgColor
    }
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    traitCollection.performAsCurrent {
      highligtedBackground.layer.borderColor = tintColor.cgColor
      layer.borderColor = .fluid.placeholder
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    textField.frame = CGRect(
      x: bounds.minX + 10,
      y: bounds.minY + 10,
      width: bounds.width - 20,
      height: textField.intrinsicContentSize.height
    )
    placeholderLabel.frame = textField.frame

    highligtedBackground.frame = bounds
  }

  @objc func editingDidBegin(_ textField: UITextField) {
    let animator = animator()
    animator.addAnimations {
      self.highligtedBackground.alpha = 1
    }
    animator.startAnimation()
  }

  @objc func editingDidEnd(_ textField: UITextField) {
    let animator = animator()
    animator.addAnimations {
      self.highligtedBackground.alpha = 0
    }
    animator.startAnimation()
  }

  @objc func editingChanged(_ textField: UITextField) {
    placeholderLabel.isHidden = textField.text.map { !$0.isEmpty } ?? false
  }
}

// MARK: - FloatingTextFieldContentView

class FloatingTextFieldContentView: UIView, TextFieldContentView {
  let textField: UITextField
  let placeholderLabel: UILabel
  let floatingScale: CGFloat = 0.75

  override var intrinsicContentSize: CGSize {
    let textFieldSize = textField.intrinsicContentSize
    return CGSize(width: textFieldSize.width, height: textFieldSize.height * 2)
  }

  init(textField: UITextField, placeholderLabel: UILabel) {
    self.textField = textField
    self.placeholderLabel = placeholderLabel
    super.init(frame: .zero)

    placeholderLabel.textColor = .fluid.placeholder
    addSubview(placeholderLabel)

    textField.addTarget(self, action: #selector(editingDidBegin(_:)), for: .editingDidBegin)
    textField.addTarget(self, action: #selector(editingDidEnd(_:)), for: .editingDidEnd)
    addSubview(textField)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    let textFieldSize = textField.intrinsicContentSize
    textField.frame = CGRect(
      x: bounds.minX,
      y: bounds.maxY - textFieldSize.height,
      width: bounds.width,
      height: textFieldSize.height
    )

    placeholderLabel.frame = placeholderRect(isFloating: textField.isEditing || textField.text.map { !$0.isEmpty } ?? false)
  }

  func placeholderRect(isFloating: Bool) -> CGRect {
    let size = placeholderLabel.intrinsicContentSize
    if isFloating {
      return CGRect(
        x: bounds.minX,
        y: bounds.minY,
        width: min(bounds.width, size.width),
        height: size.height
      )
    } else {
      return CGRect(
        x: textField.frame.minX,
        y: textField.frame.midY - size.height * 0.5,
        width: min(bounds.width, size.width),
        height: size.height
      )
    }
  }

  @objc func editingDidBegin(_ textField: UITextField) {
    let transform = CGAffineTransform(scaleX: floatingScale, y: floatingScale)
    let color = tintColor
    let frame = placeholderRect(isFloating: true)
    let animator = animator()
    animator.addAnimations {
      self.placeholderLabel.transform = transform
      self.placeholderLabel.textColor = color
      self.placeholderLabel.frame = frame
    }
    animator.startAnimation()
  }

  @objc func editingDidEnd(_ textField: UITextField) {
    let isFloating = textField.text.map { !$0.isEmpty } ?? false
    guard !isFloating else {
      return
    }
    let transform: CGAffineTransform = .identity
    let color: UIColor = .fluid.placeholder
    let frame = placeholderRect(isFloating: false)
    let animator = animator()
    animator.addAnimations {
      self.placeholderLabel.transform = transform
      self.placeholderLabel.textColor = color
      self.placeholderLabel.frame = frame
    }
    animator.startAnimation()
  }
}
