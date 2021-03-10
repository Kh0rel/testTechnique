//
//  TestCellIntegration.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import XCTest
import UIKit
@testable import TestTechnique

class TestCellIntegration: XCTestCase {
   
   func testWrongCellTypeData() {
      let formattedData = FakeFormattedData()
      let cellType = ContentDataBuilder.cellType(for: formattedData)
      
      XCTAssertTrue(cellType == UICollectionViewCell.self)
   }
   
   func testCorrectCellTypeData() {
      let formattedData = OfferDetailsItem.offerInformation(FakeOfferDetailsOffersInformations())
      let cellType = ContentDataBuilder.cellType(for: formattedData)
      
      XCTAssertTrue(cellType == OfferInformationsCollectionViewCell.self)
   }
   
   
}
