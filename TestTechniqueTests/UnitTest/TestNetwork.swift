//
//  TestHttpRequestBuilder.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import XCTest
@testable import TestTechnique
class TestNetwork: XCTestCase {
   
   var urlRequest: URLRequest?
   
   override func setUp() {
      let builder = HttpRequestBuilder()
      let urlRequest = builder.buildRequest(with: .offers).extractUrlRequest()
      self.urlRequest = try? urlRequest.get()
   }
   
   override func tearDown() {
      
   }
   
   func testRequestCorrectlyBuilded() {
      let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/value.json")
      let builder = HttpRequestBuilder()
      let urlRequest = builder.buildRequest(with: .custom(value: "value.json")).extractUrlRequest()
      
      XCTAssertEqual(url, try? urlRequest.get().url)
   }
   
   func testNetworkTaskResumed() {
      let dataTask = MockSessionDataTask()
      let urlSession = MockSession()
      urlSession.nextDataTask = dataTask
      let dataFetcher = OfferDataFetcher(session: urlSession)
      if let urlRequest = self.urlRequest {
         dataFetcher.fetchOffers(from: urlRequest) { (_) in
            XCTAssertTrue(dataTask.resumeWasCalled)
         }
      }
   }
   
}
