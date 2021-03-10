//
//  TestCells.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import XCTest
import UIKit
@testable import TestTechnique

class TestCells: XCTestCase {
   
   func testWrongSizableDatas() {
     let data = OfferListItem.categories([])
     let size = MockCellSizable.size(with: data,
                                     fitting: CGSize(width: 2, height: 2),
                                     at: IndexPath(item: 0, section: 0))
      
      XCTAssertTrue(CGSize.zero == size)
   }
   
   func testCorrectSizableDatas() {
      let data = OfferDetailsItem.offerInformation(FakeOfferDetailsOffersInformations())
      let initialSize = CGSize(width: 20, height: 20)
      let size = MockCellSizable.size(with: data,
                                      fitting: initialSize,
                                      at: IndexPath(item: 0, section: 0))
      
      XCTAssertTrue(initialSize == size)
   }
   
   func testWrongUpdatebleCellData() {
      let data = OfferListItem.categories([])
      let cellUpdatable = MockCellUpdatable()
      cellUpdatable.update(content: data)
      
      XCTAssertFalse(cellUpdatable.isCorrectlyUpdatable)
   }
   
   func testCorrectUpdatableCellData() {
      let data = OfferDetailsItem.offerInformation(FakeOfferDetailsOffersInformations())
      let cellUpdatable = MockCellUpdatable()
      cellUpdatable.update(content: data)
      
      XCTAssertTrue(cellUpdatable.isCorrectlyUpdatable)
   }
}
