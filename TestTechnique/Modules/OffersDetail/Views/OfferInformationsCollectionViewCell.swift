//
//  OfferInformationsCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 08/03/2021.
//

import UIKit

class OfferInformationsCollectionViewCell: UICollectionViewCell {
   
   private static let separatorSpacing: CGFloat = 26
   
   private var titleLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      view.numberOfLines = 2
      
      return view
   }()
   
   private var priceLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
      view.textColor = .orange
      
      return view
   }()
   
   private var dateLabel: UILabel = {
      let view = UILabel(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
      return view
   }()
   
   private var separatorView: UIView = {
      let view = UIView(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .lightGray
      
      return view
   }()
    
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(self.titleLabel)
      self.addSubview(self.priceLabel)
      self.addSubview(self.dateLabel)
      self.addSubview(self.separatorView)
      
      NSLayoutConstraint.activate([
         self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
         self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
         self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         self.priceLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
         self.priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 2),
         self.dateLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
         self.dateLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 2),
         self.separatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         self.separatorView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.5),
         self.separatorView.heightAnchor.constraint(equalToConstant: 1),
         self.bottomAnchor.constraint(equalTo: self.separatorView.bottomAnchor, constant: 0)
      ])
   }
   
}

extension OfferInformationsCollectionViewCell: CellUpdatable {
   func update(content: FormattedModelProtocol) {
      guard let content = content as? OfferDetailsItem,
            case OfferDetailsItem.offerInformation(let offerInformation) = content else { return }
      
      self.titleLabel.text = offerInformation.titleText
      self.priceLabel.text = "\(offerInformation.priceText ?? "") €"
      self.dateLabel.text  = offerInformation.date?.humanReadableDate() ?? ""
   }
}

extension OfferInformationsCollectionViewCell: CellSizable {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      guard let content = content as? OfferDetailsItem,
            case OfferDetailsItem.offerInformation(let offerInformation) = content else { return .zero }
      
      var heightSize = height(for: offerInformation.titleText ?? "",
                          fitting: size,
                          with: [.font: UIFont.systemFont(ofSize: 22, weight: .semibold)])
      
      heightSize += height(for: offerInformation.priceText ?? "",
                           fitting: size,
                           with: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)])
      
      heightSize += height(for: offerInformation.date?.humanReadableDate() ?? "",
                           fitting: size,
                           with: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)])
      
      return CGSize(width: size.width, height: heightSize + separatorSpacing)
   }
   
   
   private static func height(for text: String, fitting size: CGSize, with attributes: [NSAttributedString.Key : Any]) -> CGFloat {
      let attributedString = NSAttributedString(string: text,
                                                attributes: attributes)
      
      return attributedString.boundingRect(with: CGSize(width: size.width,
                                                        height: CGFloat.greatestFiniteMagnitude),
                                           options: [.usesLineFragmentOrigin, .usesFontLeading],
                                           context: nil).height
   }
}
