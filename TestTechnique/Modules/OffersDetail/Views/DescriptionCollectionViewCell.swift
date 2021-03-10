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
         descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
      ])
      
   }
   
}

extension DescriptionCollectionViewCell: CellUpdatable {
   func update(content: FormattedModelProtocol) {
      guard let content = content as? OfferDetailsItem,
            case OfferDetailsItem.description(let description) = content,
            let descriptionText = description.descriptionText else { return }
      
      let paragraphAlignment = NSMutableParagraphStyle()
      paragraphAlignment.alignment = .justified
      self.descriptionLabel.attributedText = NSAttributedString(string: descriptionText.descriptionFormat,
                                                attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                             .foregroundColor: UIColor.darkGray,
                                                             .paragraphStyle: paragraphAlignment])
   }
}

extension DescriptionCollectionViewCell: CellSizable {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      guard let content = content as? OfferDetailsItem,
            case OfferDetailsItem.description(let description) = content,
            let descriptionText = description.descriptionText else { return .zero }
      
      let paragraphAlignment = NSMutableParagraphStyle()
      paragraphAlignment.alignment = .justified
      let attributedString = NSAttributedString(string: descriptionText.descriptionFormat,
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
