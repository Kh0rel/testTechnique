//
//  Environment.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

enum Environment {
   enum API {
      case preprod
      case store
   }
}

extension Environment.API {
      
   var baseUrl: String {
      switch self {
      case .preprod: return ""
      case .store: return "raw.githubusercontent.com"
      }
   }
   
   var path: String {
      switch self {
      case .preprod: return ""
      case .store: return "/leboncoin/paperclip/master/"
      }
   }
}
