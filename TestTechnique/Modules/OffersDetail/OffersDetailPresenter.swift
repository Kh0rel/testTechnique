//
//  OffersDetailPresenter.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import Foundation

final class OffersDetailPresenter {
   
   // MARK: - Private properties -
   
   private unowned let view: OffersDetailViewProtocol
   private let interactor: OffersDetailInteractorProtocol
   private let wireframe: OffersDetailWireframeProtocol
   
   private let offer: Offer
   
   // MARK: - Public properties -
   var sections: [Section<OfferDetailsItem>] = [] {
      didSet {
         self.view.reloadData()
      }
   }
   // MARK: - Lifecycle -
   
   init(view: OffersDetailViewProtocol, interactor: OffersDetailInteractorProtocol, wireframe: OffersDetailWireframeProtocol, offer: Offer) {
      self.view = view
      self.interactor = interactor
      self.wireframe = wireframe
      self.offer = offer
   }
}

// MARK: - Extensions -

extension OffersDetailPresenter: OffersDetailPresenterProtocol {
   
   private var headerSection: Section<OfferDetailsItem> {
      return Section(items: [OfferDetailsItem.header(self.offer)])
   }
   
   private var sellerInformationSection: Section<OfferDetailsItem> {
      return Section(items: [OfferDetailsItem.sellerInformation(self.offer)])
   }
   
   private var descriptionSection: Section<OfferDetailsItem> {
      return Section(items: [OfferDetailsItem.description(self.offer)])
   }
   
   private var offerInformationSection: Section<OfferDetailsItem> {
      return Section(items: [OfferDetailsItem.offerInformation(self.offer)])
   }
   
   func viewDidLoad() {
      self.sections = [
         self.headerSection,
         self.offerInformationSection,
         self.descriptionSection,
         self.sellerInformationSection,
      ]
      
   }
   
   func didTapClosedButton() {
      self.wireframe.dismiss()
   }
}
