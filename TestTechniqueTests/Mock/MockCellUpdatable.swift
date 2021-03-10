//
//  MockCellUpdatable.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import Foundation
@testable import TestTechnique

final class MockCellUpdatable: CellUpdatable {
   
   var isCorrectlyUpdatable: Bool = false
   
   func update(content: FormattedModelProtocol) {
      guard case OfferDetailsItem.offerInformation(_) = content else {
         self.isCorrectlyUpdatable = false
         return
      }
      
      self.isCorrectlyUpdatable = true
   }
}
