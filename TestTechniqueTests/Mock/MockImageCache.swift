//
//  MockImageCache.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 11/03/2021.
//

import Foundation
import UIKit
@testable import TestTechnique

final class MockImageCache: ImageCacheType {
   
   private lazy var cache: [AnyHashable: AnyObject] = [:]
   
   func insertImage(_ image: UIImage?, for url: URL) {
      self.cache[url as AnyHashable] = image
   }
   
   func image(for url: URL) -> UIImage? {
      return self.cache[url as AnyHashable] as? UIImage ?? nil
   }
}
