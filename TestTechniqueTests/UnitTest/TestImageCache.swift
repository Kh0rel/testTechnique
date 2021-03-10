//
//  TestImageCache.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 11/03/2021.
//

import XCTest
import UIKit

class TestImageCache: XCTestCase {
   
   func testInsertNullableImage() {
      let cache = MockImageCache()
      guard let url = URL(string: "https://www.google.com") else {
         XCTFail()
         return
      }
      
      cache.insertImage(nil, for: url)
      
      XCTAssertNil(cache.image(for: url))
   }
   
   func testInsertCorrectImage() {
      let cache = MockImageCache()
      guard let url = URL(string: "https://www.google.com") else {
         XCTFail()
         return
      }
      
      cache.insertImage(UIImage(), for: url)
      
      XCTAssertTrue(cache.image(for: url) != nil)
   }

}
