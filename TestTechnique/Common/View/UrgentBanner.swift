//
//  UrgentlyBanner.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 09/03/2021.
//

import Foundation
import UIKit

class UrgentBanner: UIView {
   
   var titleLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.text = "Urgent"
      view.textColor = .red
      view.font = UIFont.systemFont(ofSize: 12, weight: .bold)
      return view
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .white
      self.layer.borderColor = UIColor.red.cgColor
      self.layer.borderWidth = 1
      self.layer.cornerRadius = 2
      self.addSubview(self.titleLabel)
      NSLayoutConstraint.activate([
         self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
         self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
         self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
         self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2)
      ])
   }
}
