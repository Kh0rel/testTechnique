//
//  MockSession.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import Foundation
@testable import TestTechnique

final class MockSession: URLSessionProtocol {
   
   var nextDataTask = MockSessionDataTask()
   
   
   func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
      
      return self.nextDataTask
   }
}


final class MockSessionDataTask: URLSessionDataTaskProtocol {
   
   private(set) var resumeWasCalled: Bool = false
   
   func resume() {
      
      self.resumeWasCalled = true
   }
}
