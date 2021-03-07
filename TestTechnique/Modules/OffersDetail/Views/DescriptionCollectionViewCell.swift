//
//  DescriptionCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
   
   public var descriptionLabel: UILabel = {
      let paragraphAlignment = NSMutableParagraphStyle()
      paragraphAlignment.alignment = .justified
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .darkText
      label.numberOfLines = -1
      
      label.attributedText = NSAttributedString(string: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
                                                attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                             .foregroundColor: UIColor.darkGray,
                                                             .paragraphStyle: paragraphAlignment])
      
      return label
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addSubview(descriptionLabel)
      NSLayoutConstraint.activate([
         descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
         descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
         descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
      ])
      
   }
   
}


extension DescriptionCollectionViewCell: ContentSizable {
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
      
      return CGSize(width: size.width, height: height)
   }
}
