//
//  SellerInformationsCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

class SellerInformationsCollectionViewCell: UICollectionViewCell {
   
   private var containerView: UIView = {
      let view = UIView(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.layer.borderWidth = 1
      view.layer.borderColor = UIColor.darkGray.cgColor
      view.layer.cornerRadius = 2
      return view
   }()
    
   private var aboutLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addSubview(containerView)
      self.containerView.addSubview(aboutLabel)
      NSLayoutConstraint.activate([
         self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
         self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
         self.containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         self.containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
         self.aboutLabel.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
         self.aboutLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
      ])
   }
   
}

extension SellerInformationsCollectionViewCell: CellUpdatable {
   func update(content: FormattedModelProtocol) {
      guard let content = content as? OfferDetailsItem,
         case OfferDetailsItem.sellerInformation(let sellerInformation) = content,
         let siren = sellerInformation.siren else { return }
      
      self.aboutLabel.text = "SIREN : " + siren
   }
}

extension SellerInformationsCollectionViewCell: CellSizable {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      guard let content = content as? OfferDetailsItem,
         case OfferDetailsItem.sellerInformation(let sellerInformation) = content,
         sellerInformation.siren != nil else { return .zero }
      
      let paragraphAlignment = NSMutableParagraphStyle()
      paragraphAlignment.alignment = .justified
      let attributedString = NSAttributedString(string: sellerInformation.siren ?? "",
                                                attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                             .foregroundColor: UIColor.darkGray,
                                                             .paragraphStyle: paragraphAlignment])
      
      let height = attributedString.boundingRect(with: CGSize(width: size.width - 20,
                                                              height: CGFloat.greatestFiniteMagnitude),
                                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                 context: nil).height
      
      return CGSize(width: size.width, height: height + 50)
   }
}
