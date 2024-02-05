//
//  Colors.swift
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

// MARK: - UIColor.Fluid

extension UIColor {
  public static let fluid = Fluid.self

  public struct Fluid {
    // Accent Colors
    public static let red    = UIColor(light: #colorLiteral(red:1.000, green:0.329, blue:0.290, alpha:1.00), dark: #colorLiteral(red:1.000, green:0.369, blue:0.329, alpha:1.00))
    public static let orange = UIColor(light: #colorLiteral(red:1.000, green:0.627, blue:0.102, alpha:1.00), dark: #colorLiteral(red:1.000, green:0.663, blue:0.141, alpha:1.00))
    public static let yellow = UIColor(light: #colorLiteral(red:1.000, green:0.820, blue:0.102, alpha:1.00), dark: #colorLiteral(red:1.000, green:0.855, blue:0.141, alpha:1.00))
    public static let green  = UIColor(light: #colorLiteral(red:0.282, green:0.780, blue:0.408, alpha:1.00), dark: #colorLiteral(red:0.271, green:0.820, blue:0.408, alpha:1.00))
    public static let mint   = UIColor(light: #colorLiteral(red:0.078, green:0.780, blue:0.749, alpha:1.00), dark: #colorLiteral(red:0.482, green:0.831, blue:0.816, alpha:1.00))
    public static let teal   = UIColor(light: #colorLiteral(red:0.267, green:0.702, blue:0.780, alpha:1.00), dark: #colorLiteral(red:0.341, green:0.800, blue:0.878, alpha:1.00))
    public static let cyan   = UIColor(light: #colorLiteral(red:0.290, green:0.706, blue:0.902, alpha:1.00), dark: #colorLiteral(red:0.490, green:0.851, blue:1.000, alpha:1.00))
    public static let blue   = UIColor(light: #colorLiteral(red:0.102, green:0.529, blue:1.000, alpha:1.00), dark: #colorLiteral(red:0.141, green:0.569, blue:1.000, alpha:1.00))
    public static let indigo = UIColor(light: #colorLiteral(red:0.427, green:0.420, blue:0.839, alpha:1.00), dark: #colorLiteral(red:0.459, green:0.451, blue:0.902, alpha:1.00))
    public static let purple = UIColor(light: #colorLiteral(red:0.714, green:0.408, blue:0.871, alpha:1.00), dark: #colorLiteral(red:0.780, green:0.447, blue:0.949, alpha:1.00))
    public static let pink   = UIColor(light: #colorLiteral(red:1.000, green:0.278, blue:0.416, alpha:1.00), dark: #colorLiteral(red:1.000, green:0.322, blue:0.455, alpha:1.00))
    public static let brown  = UIColor(light: #colorLiteral(red:0.635, green:0.545, blue:0.431, alpha:1.00), dark: #colorLiteral(red:0.675, green:0.584, blue:0.471, alpha:1.00))

    // Gray Colors
    public static let gray  = UIColor(light: #colorLiteral(red:0.557, green:0.557, blue:0.576, alpha:1.00), dark: #colorLiteral(red:0.557, green:0.557, blue:0.576, alpha:1.00))
    public static let gray2 = UIColor(light: #colorLiteral(red: 0.682, green: 0.682, blue: 0.698, alpha: 1), dark: #colorLiteral(red:0.388, green:0.388, blue:0.400, alpha:1.00))
    public static let gray3 = UIColor(light: #colorLiteral(red:0.780, green:0.780, blue:0.800, alpha:1.00), dark: #colorLiteral(red:0.282, green:0.282, blue:0.290, alpha:1.00))
    public static let gray4 = UIColor(light: #colorLiteral(red:0.820, green:0.820, blue:0.839, alpha:1.00), dark: #colorLiteral(red:0.227, green:0.227, blue:0.235, alpha:1.00))
    public static let gray5 = UIColor(light: #colorLiteral(red:0.898, green:0.898, blue:0.918, alpha:1.00), dark: #colorLiteral(red:0.173, green:0.173, blue:0.180, alpha:1.00))
    public static let gray6 = UIColor(light: #colorLiteral(red:0.949, green:0.949, blue:0.969, alpha:1.00), dark: #colorLiteral(red:0.110, green:0.110, blue:0.118, alpha:1.00))

    // Label Colors
    public static let primary     = UIColor(light: #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1), dark: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1))
    public static let secondary   = UIColor(light: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.6), dark: #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9607843137, alpha: 0.6))
    public static let tertiary    = UIColor(light: #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.3), dark: #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9607843137, alpha: 0.3))
    public static let quaternary  = UIColor(light: #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.18), dark: #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9607843137, alpha: 0.18))
    public static let placeholder = UIColor(light: #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.6), dark: #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9607843137, alpha: 0.6))

    // Fill Colors
    public static let background  = UIColor(light: #colorLiteral(red:1.000, green:1.000, blue:1.000, alpha:1.00), dark: #colorLiteral(red: 0.109, green: 0.109, blue: 0.117, alpha: 1))
    public static let disabled    = UIColor(light: #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.33), dark: #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9607843137, alpha: 0.33))
    public static let highlighted = UIColor(light: #colorLiteral(red:0.557, green:0.557, blue:0.576, alpha:0.25), dark: #colorLiteral(red:0.557, green:0.557, blue:0.576, alpha:0.25))
    public static let selected    = UIColor.fluid.gray5
    public static let shadow      = UIColor(white: 0, alpha: 0.33)

    // Elevation Colors
    public static let elevatedPrimary   = UIColor(light: #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1), dark: #colorLiteral(red: 0.109, green: 0.109, blue: 0.117, alpha: 1))
    public static let elevatedSecondary = UIColor(light: #colorLiteral(red:1.000, green:1.000, blue:1.000, alpha:1.00), dark: #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1803921569, alpha: 1))
  }

  public convenience init(light: UIColor, dark: UIColor) {
    self.init { $0.userInterfaceStyle == .dark ? dark : light }
  }
}

// MARK: - CGColor.Fluid

extension CGColor {
  public static let fluid = Fluid.self

  public struct Fluid {
    public struct Fluid {
      // Accent Colors
      @inlinable public static var red: CGColor { UIColor.fluid.red.cgColor }
      @inlinable public static var orange: CGColor { UIColor.fluid.orange.cgColor }
      @inlinable public static var yellow: CGColor { UIColor.fluid.yellow.cgColor }
      @inlinable public static var green: CGColor { UIColor.fluid.green.cgColor }
      @inlinable public static var mint: CGColor { UIColor.fluid.mint.cgColor }
      @inlinable public static var teal: CGColor { UIColor.fluid.teal.cgColor }
      @inlinable public static var cyan: CGColor { UIColor.fluid.cyan.cgColor }
      @inlinable public static var blue: CGColor { UIColor.fluid.blue.cgColor }
      @inlinable public static var indigo: CGColor { UIColor.fluid.indigo.cgColor }
      @inlinable public static var purple: CGColor { UIColor.fluid.purple.cgColor }
      @inlinable public static var pink: CGColor { UIColor.fluid.pink.cgColor }
      @inlinable public static var brown: CGColor { UIColor.fluid.brown.cgColor }

      // Gray Colors
      @inlinable public static var gray: CGColor { UIColor.fluid.gray.cgColor }
      @inlinable public static var gray2: CGColor { UIColor.fluid.gray2.cgColor }
      @inlinable public static var gray3: CGColor { UIColor.fluid.gray3.cgColor }
      @inlinable public static var gray4: CGColor { UIColor.fluid.gray4.cgColor }
      @inlinable public static var gray5: CGColor { UIColor.fluid.gray5.cgColor }
      @inlinable public static var gray6: CGColor { UIColor.fluid.gray6.cgColor }

      // Label Colors
      @inlinable public static var primary: CGColor { UIColor.fluid.primary.cgColor }
      @inlinable public static var secondary: CGColor { UIColor.fluid.secondary.cgColor }
      @inlinable public static var tertiary: CGColor { UIColor.fluid.tertiary.cgColor }
      @inlinable public static var quaternary: CGColor { UIColor.fluid.quaternary.cgColor }
      @inlinable public static var placeholder: CGColor { UIColor.fluid.placeholder.cgColor }

      // Fill Colors
      @inlinable public static var background: CGColor { UIColor.fluid.background.cgColor }
      @inlinable public static var disabled: CGColor { UIColor.fluid.disabled.cgColor }
      @inlinable public static var highlighted: CGColor { UIColor.fluid.highlighted.cgColor }
      @inlinable public static var selected: CGColor { UIColor.fluid.selected.cgColor }
      @inlinable public static var shadow: CGColor { UIColor.fluid.shadow.cgColor }

      // Elevation Colors
      @inlinable public static var elevatedPrimary: CGColor { UIColor.fluid.elevatedPrimary.cgColor }
      @inlinable public static var elevatedSecondary: CGColor { UIColor.fluid.elevatedSecondary.cgColor }
    }
  }
}

// MARK: - Color.Fluid

extension Color {
  public static let fluid = Fluid.self

  public struct Fluid {
    public static let red    = Color(uiColor: .fluid.red)
    public static let orange = Color(uiColor: .fluid.orange)
    public static let yellow = Color(uiColor: .fluid.yellow)
    public static let green  = Color(uiColor: .fluid.green)
    public static let mint   = Color(uiColor: .fluid.mint)
    public static let teal   = Color(uiColor: .fluid.teal)
    public static let cyan   = Color(uiColor: .fluid.cyan)
    public static let blue   = Color(uiColor: .fluid.blue)
    public static let indigo = Color(uiColor: .fluid.indigo)
    public static let purple = Color(uiColor: .fluid.purple)
    public static let pink   = Color(uiColor: .fluid.pink)
    public static let brown  = Color(uiColor: .fluid.brown)

    // Gray Colors
    public static let gray  = Color(uiColor: .fluid.gray)
    public static let gray2 = Color(uiColor: .fluid.gray2)
    public static let gray3 = Color(uiColor: .fluid.gray3)
    public static let gray4 = Color(uiColor: .fluid.gray4)
    public static let gray5 = Color(uiColor: .fluid.gray5)
    public static let gray6 = Color(uiColor: .fluid.gray6)

    // Label Colors
    public static let primary     = Color(uiColor: .fluid.primary)
    public static let secondary   = Color(uiColor: .fluid.secondary)
    public static let tertiary    = Color(uiColor: .fluid.tertiary)
    public static let quaternary  = Color(uiColor: .fluid.quaternary)
    public static let placeholder = Color(uiColor: .fluid.placeholder)

    // Fill Colors
    public static let background  = Color(uiColor: .fluid.background)
    public static let disabled    = Color(uiColor: .fluid.disabled)
    public static let highlighted = Color(uiColor: .fluid.highlighted)
    public static let selected    = Color(uiColor: .fluid.selected)
    public static let shadow      = Color(uiColor: .fluid.shadow)

    // Elevation Colors
    public static let elevatedPrimary   = Color(uiColor: .fluid.elevatedPrimary)
    public static let elevatedSecondary = Color(uiColor: .fluid.elevatedSecondary)
  }
}

// MARK: - ShapeStyle (Fluid)

extension ShapeStyle where Self == Color {
  public static var fluid: Color.Fluid.Type { Color.Fluid.self }
}

// MARK: - Color Preview

@available(iOS 17.0, *)
#Preview {
  struct ColorSet {
    let name: String
    let items: [Item]

    struct Item {
      let name: String
      let color: Color
    }
  }
  let colorSets = [
    ColorSet(
      name: "Accent Colors",
      items: [
        ColorSet.Item(name: "Red", color: .fluid.red),
        ColorSet.Item(name: "Orange", color: .fluid.orange),
        ColorSet.Item(name: "Yellow", color: .fluid.yellow),
        ColorSet.Item(name: "Green", color: .fluid.green),
        ColorSet.Item(name: "Mint", color: .fluid.mint),
        ColorSet.Item(name: "Teal", color: .fluid.teal),
        ColorSet.Item(name: "Cyan", color: .fluid.cyan),
        ColorSet.Item(name: "Blue", color: .fluid.blue),
        ColorSet.Item(name: "Indigo", color: .fluid.indigo),
        ColorSet.Item(name: "Purple", color: .fluid.purple),
        ColorSet.Item(name: "Pink", color: .fluid.pink),
        ColorSet.Item(name: "Brown", color: .fluid.brown)
      ]
    ),
    ColorSet(
      name: "Gray Colors",
      items: [
        ColorSet.Item(name: "Gray", color: .fluid.gray),
        ColorSet.Item(name: "Gray2", color: .fluid.gray2),
        ColorSet.Item(name: "Gray3", color: .fluid.gray3),
        ColorSet.Item(name: "Gray4", color: .fluid.gray4),
        ColorSet.Item(name: "Gray5", color: .fluid.gray5),
        ColorSet.Item(name: "Gray6", color: .fluid.gray6)
      ]
    ),
    ColorSet(
      name: "Fill Colors",
      items: [
        ColorSet.Item(name: "Primary", color: .fluid.primary),
        ColorSet.Item(name: "Secondary", color: .fluid.secondary),
        ColorSet.Item(name: "Tertiary", color: .fluid.tertiary),
        ColorSet.Item(name: "Quaternary", color: .fluid.quaternary),
        ColorSet.Item(name: "Placeholder", color: .fluid.placeholder)
      ]
    ),
    ColorSet(
      name: "Elevation Colors",
      items: [
        ColorSet.Item(name: "Elevated Primary", color: .fluid.elevatedPrimary),
        ColorSet.Item(name: "Elevated Secondary", color: .fluid.elevatedSecondary)
      ]
    )
  ]
  return NavigationView {
    List {
      ForEach(colorSets, id: \.name) { colorSet in
        Section(header: Text(colorSet.name)) {
          ForEach(colorSet.items, id: \.name) { item in
            HStack {
              RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(item.color)
                .frame(width: 50, height: 50)
                .overlay {
                  RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .strokeBorder(.black.opacity(0.05), lineWidth: 2)
                }
              Text(item.name)
                .font(.fluid.body)
            }
          }
        }
      }
    }
    .navigationTitle("Fluid Colors")
  }
}
