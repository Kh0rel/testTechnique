//
//  MockCellSizable.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import Foundation
import UIKit
@testable import TestTechnique

class MockCellSizable: CellSizable {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize {
      guard case OfferDetailsItem.offerInformation(let informations) = content else {
         return .zero
      }
      
      return size
   }
}
