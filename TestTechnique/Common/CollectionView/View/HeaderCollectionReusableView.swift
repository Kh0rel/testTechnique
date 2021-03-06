//
//  HeaderCollectionReusableView.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 08/03/2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
   
   private var titleLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
      label.textAlignment = .center
      return label
   }()
   
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(titleLabel)
      NSLayoutConstraint.activate([
         self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
      ])
   }
   
   func update(text: String) {
      self.titleLabel.text = text
   }
}
