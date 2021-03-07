//
//  SellerInformationsCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

class SellerInformationsCollectionViewCell: UICollectionViewCell {
    
   private var aboutLabel: UILabel = {
      let paragraphAlignment = NSMutableParagraphStyle()
      paragraphAlignment.alignment = .justified
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      
      view.attributedText = NSAttributedString(string: "SIRET: 401059",
                                               attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                            .foregroundColor: UIColor.darkGray,
                                                            .paragraphStyle: paragraphAlignment])
      return view
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(aboutLabel)
      NSLayoutConstraint.activate([
         aboutLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         aboutLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
      ])
   }
   
}


extension SellerInformationsCollectionViewCell: ContentSizable {
   static func size(with content: String, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      let paragraphAlignment = NSMutableParagraphStyle()
      paragraphAlignment.alignment = .justified
      let attributedString = NSAttributedString(string: content,
                                                attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                             .foregroundColor: UIColor.darkGray,
                                                             .paragraphStyle: paragraphAlignment])
      
      let height = attributedString.boundingRect(with: CGSize(width: size.width - 20,
                                                              height: CGFloat.greatestFiniteMagnitude),
                                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                 context: nil).height
      
      return CGSize(width: size.width, height: height + 40)
   }
}
