//
//  OffersDetailProtocols.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

protocol OffersDetailWireframeProtocol: class {
   func dismiss()
}

protocol OffersDetailViewProtocol: class {
   func reloadData()
}

protocol OffersDetailPresenterProtocol: class {
   var sections: [Section<OfferDetailsItem>] { get }
   func viewDidLoad()
   func didTapClosedButton()
}

protocol OffersDetailInteractorProtocol: class {
}

enum OfferDetailsItem: FormattedModelProtocol  {
   case header(OfferDetailsHeaderItemProtocol)
   case offerInformation(OfferDetailsOfferInformationsProtocol)
   case description(OfferDetailsDescriptionItemProtocol)
   case sellerInformation(OfferDetailsSellerInformationsProtocol)
}

protocol OfferDetailsHeaderItemProtocol {
   var imageUrl: String? { get }
}

protocol OfferDetailsOfferInformationsProtocol {
   var titleText: String? { get }
   var priceText: String? { get }
   var date: Date? { get }
}

protocol OfferDetailsSellerInformationsProtocol {
   var siren: String? { get }
}

protocol OfferDetailsDescriptionItemProtocol {
   var descriptionText: String? { get }
}
