//
//  FakeOfferDetailsOffersInformations.swift
//  TestTechniqueTests
//
//  Created by Guillaume Chieb bouares on 10/03/2021.
//

import Foundation
@testable import TestTechnique

struct FakeOfferDetailsOffersInformations: OfferDetailsOfferInformationsProtocol {
   var titleText: String? = "Test Title"
   var priceText: String? = "Text price"
   var date: Date? = Date()
}
