//
//  URLSession+Protocol.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

// MARK: - URLSessionDataTask
protocol URLSessionDataTaskProtocol {
   func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

// MARK: - URLSession

protocol URLSessionProtocol {
   func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
   func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
      return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
   }
}
