//
//  Data+Decodable.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

extension Data {
   func decode<T: Decodable>(_ type: T.Type) -> Result<T, Error> {
      do {
         let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = .iso8601
         return .success(try decoder.decode(type, from: self))
      } catch {
         return .failure(APIError.decodableError)
      }
   }
}
