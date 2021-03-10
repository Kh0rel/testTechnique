//
//  OffersProtocols.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 05/03/2021.
//

import UIKit

protocol OffersWireframeProtocol: class {
   func presentDetail(with item: Offer)
   func presentSearch(with items: [Offer], title: String)
   func dismiss()
}

protocol OffersViewProtocol: class {
   func displayCloseButton()
   func reloadData()
}

protocol OffersPresenterProtocol: class {
   var sections: [Section<OfferListItem>] { get }
   
   func viewDidLoad() 
   func didSelectItem(at indexPath: IndexPath)
   func didSelect(category: Category)
   func didTapClosedButton()
}

protocol OffersInteractorProtocol: class {
   func retrieveCategories(completionHandler: @escaping (Result<[Category], Error>) -> Void)
   func retrieveOffers(completionHandler: @escaping (Result<[Offer], Error>) -> Void)
}

enum OfferListItem: FormattedModelProtocol {
   case categories([Category])
   case offer(Offer)
}
