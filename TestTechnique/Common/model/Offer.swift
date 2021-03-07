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
