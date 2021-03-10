//
//  UIView+Shadow.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 09/03/2021.
//

import Foundation
import UIKit

extension UIView {
   func applyShadow(color: UIColor = .black, opacity: Float = 1, radius: CGFloat = 2) {
      self.layer.shadowColor = color.cgColor
      self.layer.shadowOpacity = opacity
      self.layer.shadowOffset = .zero
      self.layer.shadowRadius = radius
   }
}
