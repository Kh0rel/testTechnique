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
   case custom(value: String)
}

extension Endpoint {
   var method: String {
      switch self {
      case .categories, .offers, .custom(_): return "GET"
      }
   }
   
   var target: String {
      switch self {
      case .categories: return "categories.json"
      case .offers: return "listing.json"
      case .custom(let value): return value
      }
   }
}
