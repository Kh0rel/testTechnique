//
//  LargeContentCollectionViewCell.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

class LargeContentCollectionViewCell: UICollectionViewCell {
   
   private var containerView: UIView = {
      let view = UIView(frame: .zero)
      view.translatesAutoresizingMaskIntoConstraints = false
      
      return view
   }()
   
   private var imageView: UIImageView = {
      let imageView = UIImageView(frame: .zero)
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.contentMode = .redraw
      return imageView
      
   }()
   
   private var urgentBanner: UrgentBanner = {
      let banner = UrgentBanner(frame: .zero)
      banner.translatesAutoresizingMaskIntoConstraints = false
      return banner
   }()
   
   private var titleLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
      label.numberOfLines = 2
      return label
   }()
   
   private var priceLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
      label.textColor = .orange
      return label
   }()
   
   private var dateLabel: UILabel = {
      let label = UILabel(frame: .zero)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.font = UIFont.systemFont(ofSize: 12, weight: .light)
      return label
   }()
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.containerView.backgroundColor = .white
      self.containerView.applyShadow(color: .darkGray, opacity: 1, radius: 1)
      
      self.addSubview(containerView)
      self.addSubview(imageView)
      self.addSubview(urgentBanner)
      self.addSubview(titleLabel)
      self.addSubview(priceLabel)
      self.addSubview(dateLabel)
      
      NSLayoutConstraint.activate([
         //Container View
         containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
         containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
         containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
         containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
         //Image view
         imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
         imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
         imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
         imageView.widthAnchor.constraint(equalToConstant: 100),
         //Title
         titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 2),
         titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 2),
         titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
         // Price
         priceLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 2),
         priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4),
         // Banner
         urgentBanner.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 2),
         urgentBanner.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 4),
         // Date
         dateLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 2),
         dateLabel.topAnchor.constraint(equalTo: self.urgentBanner.bottomAnchor, constant: 4)
      ])
   }
   
}

extension LargeContentCollectionViewCell: CellUpdatable {
   func update(content: FormattedModelProtocol) {
      guard let offerListItem = content as? OfferListItem,
            case OfferListItem.offer(let offer) = offerListItem else { return }
      
      self.titleLabel.text = offer.title
      self.priceLabel.text = "\(offer.price) €"
      self.dateLabel.text = "\(offer.createdAt.humanReadableDate())"
      self.imageView.image = UIImage(named: "no_image")
      self.urgentBanner.isHidden = offer.isUrgent == false
      if let imageUrl = offer.image.small, let url = URL(string: imageUrl) {
         ImageLoader.shared.loadImage(from: url, with: URLSession.shared) {(result) in
            switch result {
            case .success(let image):
               DispatchQueue.main.async { [weak self] in
                  guard let self = self else { return }
                  self.imageView.image = image
               }
            case .failure(let error):
               print(error)
            }
         }
      }
   }
}

extension LargeContentCollectionViewCell: CellSizable {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      return CGSize(width: size.width, height: 110)
   }
}
