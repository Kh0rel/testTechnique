//
//  UIView+BlurEffect.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation
import UIKit

extension UIButton {
   func addRoundedBlurEffect(with size: CGSize, and style: UIBlurEffect.Style) {
      let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: style))
      
      blurEffect.frame = CGRect(origin: .zero, size: size)
      blurEffect.clipsToBounds = true
      blurEffect.layer.cornerRadius = size.width/2
      blurEffect.isUserInteractionEnabled = false
      
      self.insertSubview(blurEffect, at: 0)
      
      if let imageView = self.imageView {
         self.bringSubviewToFront(imageView)
      }
   }
}
