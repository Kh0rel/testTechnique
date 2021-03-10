//
//  ContentDataSizer.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import Foundation
import UIKit

struct ContentDataBuilder {
   
   static private func cellType(for model: FormattedModelProtocol) -> UICollectionViewCell.Type {
      
      switch model {
      case OfferListItem.categories(_):
         return TagsListCollectionViewCell.self
      case OfferListItem.offer(_):
         return LargeContentCollectionViewCell.self
      case OfferDetailsItem.header(_):
         return HeaderImageCollectionViewCell.self
      case OfferDetailsItem.offerInformation(_):
         return OfferInformationsCollectionViewCell.self
      case OfferDetailsItem.description(_):
         return DescriptionCollectionViewCell.self
      case OfferDetailsItem.sellerInformation(_):
         return SellerInformationsCollectionViewCell.self
      default:
         return UICollectionViewCell.self
      }
   }
   
   static func cell(for model: FormattedModelProtocol, in collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
      let cellType = self.cellType(for: model)
      
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath)
      
      if let cellUpdatable = cell as? CellUpdatable {
         cellUpdatable.update(content: model)
      }
      
      return cell
   }
   
   static func size(for model: FormattedModelProtocol,in collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
      let cellType = self.cellType(for: model)
      
      if let cellSizable = cellType as? CellSizable.Type {
         return cellSizable.size(with: model, fitting: collectionView.bounds.size, at: indexPath)
      }
      
      return .zero
   }
   
}
