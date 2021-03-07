//
//  LargeContentCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

class LargeContentCollectionViewCell: UICollectionViewCell {
   
   static let REUSE_IDENTIFIER = "LargeContentCollectionViewCell"
   
   private var imageView: UIImageView = {
      let imageView = UIImageView(frame: .zero)
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.backgroundColor = .brown
      return imageView
      
   }()
   
   private var titleLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "test"
      label.textColor = .cyan
      
      return label
   }()
   
   private var priceLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .darkGray
      label.text = "100 €"
      label.textColor = .orange
      
      return label
   }()
   
   private var dateLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "05 Janvier à 14h15"
      label.textColor = .lightText
      
      return label
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(imageView)
      self.addSubview(titleLabel)
      self.addSubview(priceLabel)
      self.addSubview(dateLabel)
      
      NSLayoutConstraint.activate([
         imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
         imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
         imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         imageView.widthAnchor.constraint(equalToConstant: 140),
         //Title
         titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 2),
         titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
         // Price
         priceLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 2),
         priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 2),
         // Date
         dateLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 2),
         dateLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)
      ])
   }
}
