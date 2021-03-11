//
//  Offer.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

struct Offer: Codable {
   let id: Int
   let categoryId: Int
   let title: String
   let description: String
   let price: Int
   let image: Image
   let createdAt: Date
   let isUrgent: Bool
   let siret: String?
   
   enum CodingKeys: String, CodingKey {
      case id
      case categoryId = "category_id"
      case title
      case description
      case price
      case image = "images_url"
      case createdAt = "creation_date"
      case isUrgent = "is_urgent"
      case siret
   }
}

// MARK: - Data Protocols extensions
extension Offer: OfferDetailsHeaderItemProtocol {
   
   var imageUrl: String? {
      return self.image.small
   }
}

extension Offer: OfferDetailsOfferInformationsProtocol {
   
   var titleText: String? {
      return self.title
   }
   
   var priceText: String? {
      return String(describing: self.price)
   }
   
   var date: Date? {
      return self.createdAt
   }
}

extension Offer: OfferDetailsDescriptionItemProtocol {
   
   var descriptionText: String? {
      return self.description
   }
}

extension Offer: OfferDetailsSellerInformationsProtocol {
   var siren: String? {
      return self.siret
   }
}
