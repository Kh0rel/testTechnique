//
//  OfferDataManager.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 08/03/2021.
//

import Foundation

struct CategoryDataFetcher {
   private let session: URLSessionProtocol
   
   init(session: URLSessionProtocol = URLSession.shared) {
      self.session = session
   }
   
   func fetchCategories(from urlRequest: URLRequest, completionHandler: @escaping (Result<[Category], Error>) -> Void ) {
      let task = session.dataTask(with: urlRequest) { (data, response, error) in
         guard let data = data else {
            completionHandler(.failure(error ?? APIError.serverError))
            return
         }
         completionHandler(data.decode([Category].self))
      }
      
      task.resume()
      
   }
}
