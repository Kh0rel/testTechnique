//
//  ImageCache.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation
import UIKit.UIImage

protocol ImageCacheType: class {
   func image(for url: URL) -> UIImage?
   func insertImage(_ image: UIImage?, for url: URL)
}

public final class ImageCache: ImageCacheType {
   
   private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
      let cache = NSCache<AnyObject, AnyObject>()
      cache.countLimit = 100
      return cache
   }()
   
   
   
   func image(for url: URL) -> UIImage? {
      if let image = self.imageCache.object(forKey: url as AnyObject) as? UIImage {
         return image
      }
      
      return nil
   }
   
   func insertImage(_ image: UIImage?, for url: URL) {
      guard let image = image else { return }
      
      imageCache.setObject(image, forKey: url as AnyObject)
   }
}
