//
//  Endpoint.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation


enum Endpoint {
   case categories
   case offers
}

extension Endpoint {
   var method: String {
      switch self {
      case .categories, .offers: return "GET"
      }
   }
   
   var target: String {
      switch self {
      case .categories: return "categories.json"
      case .offers: return "listing.json"
      }
   }
}
