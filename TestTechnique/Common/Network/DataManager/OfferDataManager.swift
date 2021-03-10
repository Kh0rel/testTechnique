//
//  OfferDataManager.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

struct OfferDataFetcher {
   private let session: URLSessionProtocol
   
   init(session: URLSessionProtocol = URLSession.shared) {
      self.session = session
   }
   
   func fetchOffers(from urlRequest: URLRequest, completionHandler: @escaping (Result<[Offer], Error>) -> Void ) {
      let task = session.dataTask(with: urlRequest) { (data, response, error) in
         guard let data = data else {
            completionHandler(.failure(error ?? APIError.serverError))
            return
         }
         completionHandler(data.decode([Offer].self))
      }
      
      task.resume()
      
   }
}
