//
//  HeaderImageCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

class HeaderImageCollectionViewCell: UICollectionViewCell {
   
   var imageView: UIImageView = {
      let view = UIImageView(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .black
      return view
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(imageView)
      
      NSLayoutConstraint.activate([
         imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         imageView.topAnchor.constraint(equalTo: self.topAnchor),
         imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
   }
   
   
    
}


extension HeaderImageCollectionViewCell: ContentSizable {
   static func size(with content: String, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      return CGSize(width: size.width, height: 200)
   }
}
