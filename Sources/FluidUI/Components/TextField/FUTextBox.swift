//
//  FUTextField.swift
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

// MARK: - FUTextField

open class FUTextField: UIControl {
  let textField = TextField(frame: .zero)
  let placeholderLabel = UILabel(frame: .zero)
  let contentView: TextFieldContentView
  lazy var delegateProxy = FUTextFieldDelegateProxy(base: self)

  open override var intrinsicContentSize: CGSize { contentView.intrinsicContentSize }

  weak open var delegate: FUTextFieldDelegate?

  // MARK: UITextField

  open var text: String? {
    get { textField.text }
    set { textField.text = newValue }
  }

  open var placeholder: String? {
    get { placeholderLabel.text }
    set { placeholderLabel.text = newValue }
  }

  open var font: UIFont? {
    get { textField.font }
    set {
      textField.font = newValue
      placeholderLabel.font = newValue
      invalidateIntrinsicContentSize()
    }
  }

  open var textAlignment: NSTextAlignment {
    get { textField.textAlignment }
    set {
      textField.textAlignment = newValue
      placeholderLabel.textAlignment = newValue
    }
  }

  open var clearsOnBeginEditing: Bool {
    get { textField.clearsOnBeginEditing }
    set { textField.clearsOnBeginEditing = newValue }
  }

  open var adjustsFontSizeToFitWidth: Bool {
    get { textField.adjustsFontSizeToFitWidth }
    set { textField.adjustsFontSizeToFitWidth = newValue }
  }

  open var minimumFontSize: CGFloat {
    get { textField.minimumFontSize }
    set { textField.minimumFontSize = newValue }
  }

  open var isEditing: Bool { textField.isEditing }

  open var clearButtonMode: UITextField.ViewMode {
    get { textField.clearButtonMode }
    set { textField.clearButtonMode = newValue }
  }

  open var leftView: UIView? {
    get { textField.leftView }
    set { textField.leftView = newValue }
  }

  open var leftViewMode: UITextField.ViewMode {
    get { textField.leftViewMode }
    set { textField.leftViewMode = newValue }
  }

  open var rightView: UIView? {
    get { textField.rightView }
    set { textField.rightView = newValue }
  }

  open var rightViewMode: UITextField.ViewMode {
    get { textField.rightViewMode }
    set { textField.rightViewMode = newValue }
  }

  open var clearsOnInsertion: Bool {
    get { textField.clearsOnInsertion }
    set { textField.clearsOnInsertion = newValue }
  }

  open var interactionState: Any {
    get { textField.interactionState }
    set { textField.interactionState = newValue }
  }

  public override init(frame: CGRect) {
    self.contentView = PlainTextFieldContentView(
      textField: textField,
      placeholderLabel: placeholderLabel
    )
    super.init(frame: frame)
    textField.responder = self
    textField.font = .fluid.body()
    textField.delegate = delegateProxy
    addSubview(contentView)
  }

  public required init?(coder: NSCoder) {
    self.contentView = PlainTextFieldContentView(
      textField: textField,
      placeholderLabel: placeholderLabel
    )
    super.init(coder: coder)
    textField.responder = self
    textField.font = .fluid.body()
    textField.delegate = delegateProxy
    addSubview(contentView)
  }

  public init(style: FUTextField.Style) {
    switch style {
    case .plain:
      self.contentView = PlainTextFieldContentView(
        textField: textField,
        placeholderLabel: placeholderLabel
      )
    case .underline:
      self.contentView = UnderlineTextFieldContentView(
        textField: textField,
        placeholderLabel: placeholderLabel
      )
    case .bordered:
      self.contentView = BorderedTextFieldContentView(
        textField: textField,
        placeholderLabel: placeholderLabel
      )
    case .floatingLabel:
      self.contentView = FloatingTextFieldContentView(
        textField: textField,
        placeholderLabel: placeholderLabel
      )
    }
    super.init(frame: .zero)
    textField.responder = self
    textField.font = .fluid.body()
    textField.delegate = delegateProxy
    addSubview(contentView)
  }

  open override func layoutSubviews() {
    super.layoutSubviews()
    contentView.frame = bounds
  }

  // MARK: NSCoding

  open override func encode(with coder: NSCoder) {
    textField.encode(with: coder)
  }

  // MARK: UIResponder

  open override var inputView: UIView? {
    get { textField.inputView }
    set { textField.inputView = newValue }
  }

  open override var inputAccessoryView: UIView? {
    get { textField.inputAccessoryView }
    set { textField.inputAccessoryView = newValue }
  }

  open override var canBecomeFirstResponder: Bool { textField.canBecomeFirstResponder }

  open override var canResignFirstResponder: Bool { textField.canResignFirstResponder }

  open override var isFirstResponder: Bool { textField.isFirstResponder }

  open override func becomeFirstResponder() -> Bool {
    textField.becomeFirstResponder()
  }

  open override func resignFirstResponder() -> Bool {
    textField.resignFirstResponder()
  }

  // MARK: UIControl

  open override var isEnabled: Bool {
    didSet {
      textField.isEnabled = isEnabled
    }
  }

  open override var isSelected: Bool {
    didSet {
      textField.isSelected = isSelected
    }
  }

  open override var isHighlighted: Bool {
    didSet {
      textField.isHighlighted = isHighlighted
    }
  }

  open override var allTargets: Set<AnyHashable> { textField.allTargets }

  open override var allControlEvents: UIControl.Event { textField.allControlEvents }

  open override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
    textField.addTarget(target, action: action, for: controlEvents)
  }

  open override func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event) {
    textField.removeTarget(target, action: action, for: controlEvents)
  }

  open override func addAction(_ action: UIAction, for controlEvents: UIControl.Event) {
    textField.addAction(action, for: controlEvents)
  }

  open override func removeAction(_ action: UIAction, for controlEvents: UIControl.Event) {
    textField.removeAction(action, for: controlEvents)
  }

  open override func removeAction(identifiedBy actionIdentifier: UIAction.Identifier, for controlEvents: UIControl.Event) {
    textField.removeAction(identifiedBy: actionIdentifier, for: controlEvents)
  }

  open override func actions(forTarget target: Any?, forControlEvent controlEvent: UIControl.Event) -> [String]? {
    textField.actions(forTarget: target, forControlEvent: controlEvent)
  }

  open override func sendAction(_ action: UIAction) {
    textField.sendAction(action)
  }

  open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
    textField.sendAction(action, to: target, for: event)
  }

  open override func sendActions(for controlEvents: UIControl.Event) {
    textField.sendActions(for: controlEvents)
  }

  @available(iOS 17.4, macCatalyst 17.4, tvOS 17.4, *)
  open override func performPrimaryAction() {
    textField.performPrimaryAction()
  }
}

// MARK: - FUTextField (UIContentSizeCategoryAdjusting)

extension FUTextField: UIContentSizeCategoryAdjusting {
  public var adjustsFontForContentSizeCategory: Bool {
    get { textField.adjustsFontForContentSizeCategory }
    set { textField.adjustsFontForContentSizeCategory = newValue }
  }
}

// MARK: - FUTextField (UILetterformAwareAdjusting)

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, *)
extension FUTextField: UILetterformAwareAdjusting {
  public var sizingRule: UILetterformAwareSizingRule {
    get { textField.sizingRule }
    set { textField.sizingRule = newValue }
  }
}

// MARK: - FUTextField (UITextInput)

extension FUTextField: UITextInput {
  // MARK: UITextInputTraits

  public var autocapitalizationType: UITextAutocapitalizationType {
    get { textField.autocapitalizationType }
    set { textField.autocapitalizationType = newValue }
  }

  public var autocorrectionType: UITextAutocorrectionType {
    get { textField.autocorrectionType }
    set { textField.autocorrectionType = newValue }
  }

  public var spellCheckingType: UITextSpellCheckingType {
    get { textField.spellCheckingType }
    set { textField.spellCheckingType = newValue }
  }

  public var smartQuotesType: UITextSmartQuotesType {
    get { textField.smartQuotesType }
    set { textField.smartQuotesType = newValue }
  }

  public var smartDashesType: UITextSmartDashesType {
    get { textField.smartDashesType }
    set { textField.smartDashesType = newValue }
  }

  public var smartInsertDeleteType: UITextSmartInsertDeleteType {
    get { textField.smartInsertDeleteType }
    set { textField.smartInsertDeleteType = newValue }
  }

  @available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, *)
  public var inlinePredictionType: UITextInlinePredictionType {
    get { textField.inlinePredictionType }
    set { textField.inlinePredictionType = newValue }
  }

  public var keyboardType: UIKeyboardType {
    get { textField.keyboardType }
    set { textField.keyboardType = newValue }
  }

  public var keyboardAppearance: UIKeyboardAppearance {
    get { textField.keyboardAppearance }
    set { textField.keyboardAppearance = newValue }
  }

  public var returnKeyType: UIReturnKeyType {
    get { textField.returnKeyType }
    set { textField.returnKeyType = newValue }
  }

  public var enablesReturnKeyAutomatically: Bool {
    get { textField.enablesReturnKeyAutomatically }
    set { textField.enablesReturnKeyAutomatically = newValue }
  }

  public var isSecureTextEntry: Bool {
    get { textField.isSecureTextEntry }
    set { textField.isSecureTextEntry = newValue }
  }

  public var textContentType: UITextContentType! {
    get { textField.textContentType }
    set { textField.textContentType = newValue }
  }

  public var passwordRules: UITextInputPasswordRules? {
    get { textField.passwordRules }
    set { textField.passwordRules = newValue }
  }

  // MARK: UIKeyInput

  public var hasText: Bool { textField.hasText }

  public func insertText(_ text: String) {
    textField.insertText(text)
  }

  public func deleteBackward() {
    textField.deleteBackward()
  }

  // MARK: UITextInput

  public func text(in range: UITextRange) -> String? {
    textField.text(in: range)
  }

  public func replace(_ range: UITextRange, withText text: String) {
    textField.replace(range, withText: text)
  }

  public var selectedTextRange: UITextRange? {
    get { textField.selectedTextRange }
    set { textField.selectedTextRange = newValue }
  }

  public var markedTextRange: UITextRange? { textField.markedTextRange }

  public var markedTextStyle: [NSAttributedString.Key : Any]? {
    get { textField.markedTextStyle }
    set { textField.markedTextStyle = newValue }
  }

  public func setMarkedText(_ markedText: String?, selectedRange: NSRange) {
    textField.setMarkedText(markedText, selectedRange: selectedRange)
  }

  public func unmarkText() {
    textField.unmarkText()
  }

  public var beginningOfDocument: UITextPosition { textField.beginningOfDocument }

  public var endOfDocument: UITextPosition { textField.endOfDocument }

  public func textRange(from fromPosition: UITextPosition, to toPosition: UITextPosition) -> UITextRange? {
    textField.textRange(from: fromPosition, to: toPosition)
  }

  public func position(from position: UITextPosition, offset: Int) -> UITextPosition? {
    textField.position(from: position, offset: offset)
  }

  public func position(from position: UITextPosition, in direction: UITextLayoutDirection, offset: Int) -> UITextPosition? {
    textField.position(from: position, in: direction, offset: offset)
  }

  public func compare(_ position: UITextPosition, to other: UITextPosition) -> ComparisonResult {
    textField.compare(position, to: other)
  }

  public func offset(from: UITextPosition, to toPosition: UITextPosition) -> Int {
    textField.offset(from: from, to: toPosition)
  }

  public var inputDelegate: UITextInputDelegate? {
    get { textField.inputDelegate }
    set { textField.inputDelegate = newValue }
  }

  public var tokenizer: UITextInputTokenizer { textField.tokenizer }

  public func position(within range: UITextRange, farthestIn direction: UITextLayoutDirection) -> UITextPosition? {
    textField.position(within: range, farthestIn: direction)
  }

  public func characterRange(byExtending position: UITextPosition, in direction: UITextLayoutDirection) -> UITextRange? {
    textField.characterRange(byExtending: position, in: direction)
  }

  public func baseWritingDirection(for position: UITextPosition, in direction: UITextStorageDirection) -> NSWritingDirection {
    textField.baseWritingDirection(for: position, in: direction)
  }

  public func setBaseWritingDirection(_ writingDirection: NSWritingDirection, for range: UITextRange) {
    textField.setBaseWritingDirection(writingDirection, for: range)
  }

  public func firstRect(for range: UITextRange) -> CGRect {
    textField.firstRect(for: range)
  }

  public func caretRect(for position: UITextPosition) -> CGRect {
    textField.caretRect(for: position)
  }

  public func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
    textField.selectionRects(for: range)
  }

  public func closestPosition(to point: CGPoint) -> UITextPosition? {
    textField.closestPosition(to: point)
  }

  public func closestPosition(to point: CGPoint, within range: UITextRange) -> UITextPosition? {
    textField.closestPosition(to: point, within: range)
  }

  public func characterRange(at point: CGPoint) -> UITextRange? {
    textField.characterRange(at: point)
  }

  public func shouldChangeText(in range: UITextRange, replacementText text: String) -> Bool {
    textField.shouldChangeText(in: range, replacementText: text)
  }

  public func textStyling(at position: UITextPosition, in direction: UITextStorageDirection) -> [NSAttributedString.Key : Any]? {
    textField.textStyling(at: position, in: direction)
  }

  public func position(within range: UITextRange, atCharacterOffset offset: Int) -> UITextPosition? {
    textField.position(within: range, atCharacterOffset: offset)
  }

  public func characterOffset(of position: UITextPosition, within range: UITextRange) -> Int {
    textField.characterOffset(of: position, within: range)
  }

  public var textInputView: UIView { textField.textInputView }

  public var selectionAffinity: UITextStorageDirection { textField.selectionAffinity }

  public func insertDictationResult(_ dictationResult: [UIDictationPhrase]) {
    textField.insertDictationResult(dictationResult)
  }

  public func dictationRecordingDidEnd() {
    textField.dictationRecordingDidEnd()
  }

  public func dictationRecognitionFailed() {
    textField.dictationRecognitionFailed()
  }

  public var insertDictationResultPlaceholder: Any { textField.insertDictationResultPlaceholder }

  public func frame(forDictationResultPlaceholder placeholder: Any) -> CGRect {
    textField.frame(forDictationResultPlaceholder: placeholder)
  }

  public func removeDictationResultPlaceholder(_ placeholder: Any, willInsertResult: Bool) {
    textField.removeDictationResultPlaceholder(placeholder, willInsertResult: willInsertResult)
  }

  public func insertText(_ text: String, alternatives: [String], style: UITextAlternativeStyle) {
    textField.insertText(text, alternatives: alternatives, style: style)
  }

  public func setAttributedMarkedText(_ markedText: NSAttributedString?, selectedRange: NSRange) {
    textField.setAttributedMarkedText(markedText, selectedRange: selectedRange)
  }

  public func insertTextPlaceholder(with size: CGSize) -> UITextPlaceholder {
    textField.insertTextPlaceholder(with: size)
  }

  public func remove(_ textPlaceholder: UITextPlaceholder) {
    textField.remove(textPlaceholder)
  }

  public func beginFloatingCursor(at point: CGPoint) {
    textField.beginFloatingCursor(at: point)
  }

  public func updateFloatingCursor(at point: CGPoint) {
    textField.updateFloatingCursor(at: point)
  }

  public func endFloatingCursor() {
    textField.endFloatingCursor()
  }

  @available(iOS 17.4, macCatalyst 17.4, tvOS 17.4, *)
  public func caretTransform(for position: UITextPosition) -> CGAffineTransform {
    textField.caretTransform(for: position)
  }

  public func editMenu(for textRange: UITextRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
    textField.editMenu(for: textRange, suggestedActions: suggestedActions)
  }

  public func willPresentEditMenu(animator: UIEditMenuInteractionAnimating) {
    textField.willPresentEditMenu(animator: animator)
  }

  public func willDismissEditMenu(animator: UIEditMenuInteractionAnimating) {
    textField.willDismissEditMenu(animator: animator)
  }
}

// MARK: - FUTextField (UITextDraggable)

extension FUTextField: UITextDraggable {
  public var textDragDelegate: UITextDragDelegate? {
    get { textField.textDragDelegate }
    set { textField.textDragDelegate = newValue }
  }

  public var textDragInteraction: UIDragInteraction? { textField.textDragInteraction }

  public var isTextDragActive: Bool { textField.isTextDragActive }

  public var textDragOptions: UITextDragOptions {
    get { textField.textDragOptions }
    set { textField.textDragOptions = newValue }
  }
}

// MARK: - FUTextField (UITextDroppable)

extension FUTextField: UITextDroppable {
  public var textDropDelegate: UITextDropDelegate? {
    get { textField.textDropDelegate }
    set { textField.textDropDelegate = newValue }
  }
  
  public var textDropInteraction: UIDropInteraction? { textField.textDropInteraction }

  public var isTextDropActive: Bool { textField.isTextDropActive }
}

// MARK: - FUTextField (UITextPasteConfigurationSupporting)

extension FUTextField: UITextPasteConfigurationSupporting {
  public var pasteDelegate: UITextPasteDelegate? {
    get { textField.pasteDelegate }
    set { textField.pasteDelegate = newValue }
  }
}

// MARK: - FUTextField.Style

extension FUTextField {
  public enum Style {
    case plain
    case underline
    case bordered
    case floatingLabel
  }
}

// MARK: - FUTextField (Notification)

extension FUTextField {
  public static let textDidBeginEditingNotification = UITextField.textDidBeginEditingNotification
  public static let textDidEndEditingNotification = UITextField.textDidEndEditingNotification
  public static let textDidChangeNotification = UITextField.textDidChangeNotification
}

// MARK: - FUTextField.TextField

extension FUTextField {
  class TextField: UITextField {
    weak var responder: UIResponder?

    override var next: UIResponder? { responder?.next }
  }
}

// MARK: - FUTextField.FUTextFieldDelegateProxy

extension FUTextField {
  class FUTextFieldDelegateProxy: NSObject, UITextFieldDelegate {
    weak var base: FUTextField?

    init(base: FUTextField) {
      self.base = base
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
      base.flatMap { $0.delegate?.textFieldShouldBeginEditing?($0) } ?? true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
      base.map { $0.delegate?.textFieldDidBeginEditing?($0) }
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
      base.flatMap { $0.delegate?.textFieldShouldEndEditing?($0) } ?? true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
      base.map { $0.delegate?.textFieldDidEndEditing?($0) }
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
      base.map { $0.delegate?.textFieldDidEndEditing?($0, reason: reason) }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      base.flatMap { $0.delegate?.textField?($0, shouldChangeCharactersIn: range, replacementString: string) } ?? true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
      base.map { $0.delegate?.textFieldDidChangeSelection($0) }
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
      base.flatMap { $0.delegate?.textFieldShouldClear?($0) } ?? true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      base.flatMap { $0.delegate?.textFieldShouldReturn?($0) } ?? true
    }

    func textField(_ textField: UITextField, editMenuForCharactersIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu? {
      base.flatMap { $0.delegate?.textField?($0, editMenuForCharactersIn: range, suggestedActions: suggestedActions) }
    }

    func textField(_ textField: UITextField, willPresentEditMenuWith animator: UIEditMenuInteractionAnimating) {
      base.map { $0.delegate?.textField?($0, willPresentEditMenuWith: animator) }
    }

    func textField(_ textField: UITextField, willDismissEditMenuWith animator: UIEditMenuInteractionAnimating) {
      base.map { $0.delegate?.textField?($0, willDismissEditMenuWith: animator) }
    }
  }
}

// MARK: - FUTextFieldDelegate

@MainActor @objc public protocol FUTextFieldDelegate: NSObjectProtocol {
  @objc optional func textFieldShouldBeginEditing(_ textField: FUTextField) -> Bool

  @objc optional func textFieldDidBeginEditing(_ textField: FUTextField)

  @objc optional func textFieldShouldEndEditing(_ textField: FUTextField) -> Bool

  @objc optional func textFieldDidEndEditing(_ textField: FUTextField)

  @objc optional func textFieldDidEndEditing(_ textField: FUTextField, reason: UITextField.DidEndEditingReason)

  @objc optional func textField(_ textField: FUTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

  @objc func textFieldDidChangeSelection(_ textField: FUTextField)

  @objc optional func textFieldShouldClear(_ textField: FUTextField) -> Bool

  @objc optional func textFieldShouldReturn(_ textField: FUTextField) -> Bool

  @objc optional func textField(_ textField: FUTextField, editMenuForCharactersIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu?

  @objc optional func textField(_ textField: FUTextField, willPresentEditMenuWith animator: UIEditMenuInteractionAnimating)

  @objc optional func textField(_ textField: FUTextField, willDismissEditMenuWith animator: any UIEditMenuInteractionAnimating)
}

// MARK: - FUTextField Preview

@available(iOS 17.0, macCatalyst 17.0, tvOS 17.0, watchOS 10.0, *)
#Preview {
  let styles: [FUTextField.Style] = [.plain, .underline, .bordered, .floatingLabel]
  let makeTextField: (FUTextField.Style) -> FUTextField = { style in
    let textField = FUTextField(style: style)
    textField.placeholder = "\(style)"
    return textField
  }
  let stackView = UIStackView(arrangedSubviews: styles.map { makeTextField($0) })
  stackView.axis = .vertical
  stackView.spacing = 20
  stackView.translatesAutoresizingMaskIntoConstraints = false

  let vieWController = UIViewController()
  vieWController.view.addSubview(stackView)
  NSLayoutConstraint.activate([
    stackView.centerYAnchor.constraint(equalTo: vieWController.view.centerYAnchor),
    stackView.leadingAnchor.constraint(equalTo: vieWController.view.leadingAnchor, constant: 20),
    stackView.trailingAnchor.constraint(equalTo: vieWController.view.trailingAnchor, constant: -20)
  ])
  return vieWController
}
