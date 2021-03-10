//
//  HttpRequestBuilder.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

final class HttpRequestBuilder {
   
   private var urlCompoment: URLComponents
   
   init() {
      self.urlCompoment = URLComponents()
   }
   
   func buildRequest(with endpoint: Endpoint) -> Self {
      self.urlCompoment.scheme = "https"
      self.urlCompoment.host = Environment.api.baseUrl
      self.urlCompoment.path = Environment.api.path + endpoint.target
      
      return self
   }
   
   func extractUrlRequest() -> Result<URLRequest, APIError> {
      guard let url = self.urlCompoment.url else {
         return .failure(APIError.urlNotConform)
      }
      
      return .success(URLRequest(url: url))
   }
}
