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
      view.contentMode = .redraw
      view.backgroundColor = .black
      view.image = UIImage(named: "no_image")
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


extension HeaderImageCollectionViewCell: CellSizable {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      return CGSize(width: size.width, height: 200)
   }
}

extension HeaderImageCollectionViewCell: CellUpdatable {
   func update(content: FormattedModelProtocol) {
      guard let content = content as? OfferDetailsItem,
            case OfferDetailsItem.header(let headerItem) = content,
            let imageUrl = headerItem.imageUrl,
            let url = URL(string: imageUrl) else { return }
      
      ImageLoader.shared.loadImage(from: url, with: URLSession.shared) {(result) in
         switch result {
         case .success(let image):
            DispatchQueue.main.async { [weak self] in
               guard let self = self else { return }
               self.imageView.contentMode = .scaleAspectFit
               self.imageView.image = image
            }
         case .failure(let error):
            print(error)
         }
      }
   }
}
