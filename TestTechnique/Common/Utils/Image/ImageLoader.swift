//
//  ImageLoader.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation
import UIKit.UIImage

public final class ImageLoader {
   public static let shared = ImageLoader()
   
   
   private let cache: ImageCacheType
   
   private lazy var backgroundQueue: OperationQueue = {
      let queue = OperationQueue()
      queue.maxConcurrentOperationCount = 5
      
      return queue
   }()
   
   private init(cache: ImageCacheType = ImageCache()) {
      self.cache = cache
   }
   
   func loadImage(from url: URL, with urlSession: URLSessionProtocol, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
      if let image = cache.image(for: url) {
         completionHandler(.success(image))
      }
      
      URLSession.shared.dataTask(with: url) { (data, _, error) in
         guard let data = data,
               let image = UIImage(data: data) else {
            completionHandler(.failure(error ?? APIError.noData))
            return
         }
         completionHandler(.success(image))
      }.resume()
   }
}
