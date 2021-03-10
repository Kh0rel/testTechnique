//
//  OffersInteractor.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 05/03/2021.
//

import Foundation

final class OffersInteractor {

}

// MARK: - Extensions -

extension OffersInteractor: OffersInteractorProtocol {
   
   func retrieveOffers(completionHandler: @escaping (Result<[Offer], Error>) -> Void) {
      let builderResult = HttpRequestBuilder().buildRequest(with: .offers).extractUrlRequest()
      do {
         let offerDataFetcher = OfferDataFetcher(session: URLSession.shared)
         offerDataFetcher.fetchOffers(from: try builderResult.get(),completionHandler: completionHandler)
      } catch {
         print(error)
      }
   }
   
   func retrieveCategories(completionHandler: @escaping (Result<[Category], Error>) -> Void) {
      let builderResult = HttpRequestBuilder().buildRequest(with: .categories).extractUrlRequest()
      do {
         let categoryDataFetcher = CategoryDataFetcher(session: URLSession.shared)
         categoryDataFetcher.fetchCategories(from: try builderResult.get(), completionHandler: completionHandler)
      } catch {
         print(error)
      }
   }
}
