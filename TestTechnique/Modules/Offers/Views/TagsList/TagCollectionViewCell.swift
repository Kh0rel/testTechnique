//
//  TagCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 08/03/2021.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
   
   var titleLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
      return label
   }()
    
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addSubview(self.titleLabel)
      self.applyShadow()
      NSLayoutConstraint.activate([
         self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
         self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
   }
}
