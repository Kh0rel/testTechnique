//
//  OffersPresenter.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 05/03/2021.
//

import Foundation

final class OffersPresenter {
   
   // MARK: - Private properties -
   
   private weak var view: OffersViewProtocol?
   private var interactor: OffersInteractorProtocol
   private var wireframe: OffersWireframeProtocol
   
   private var offers: [Offer] = []
   private var categories: [Category] = []
   private(set) var sections: [Section<OfferListItem>] = []
   
   var titleCategory: String?
   // MARK: - Lifecycle -
   
   init(view: OffersViewProtocol, interactor: OffersInteractorProtocol, wireframe: OffersWireframeProtocol, offers: [Offer] = []) {
      self.view = view
      self.interactor = interactor
      self.wireframe = wireframe
      self.offers = offers
   }
   
   private func reloadData(search: Bool = false) {
      if search {
         self.sections = [
            self.offersSection
         ]
      } else {
         self.sections = [
            self.categorySection,
            self.offersSection,
         ]
      }
      
      DispatchQueue.main.async {
         self.view?.reloadData()
      }
   }
}

// MARK: - Extensions -

extension OffersPresenter: OffersPresenterProtocol {
   
   private var categorySection: Section<OfferListItem> {
      let titleHeader = self.categories.isEmpty == false ? "Catégories" : nil
      return Section(header: titleHeader, items: [OfferListItem.categories(self.categories)])
   }
   
   private var offersSection: Section<OfferListItem> {
      return Section(header: self.titleCategory ?? "Offres",
                     items: self.offers.map { OfferListItem.offer($0) })
   }
   
   func viewDidLoad() {
      guard self.offers.isEmpty else {
         self.view?.displayCloseButton()
         self.reloadData(search: true)
         return
      }
      
      self.interactor.retrieveCategories { [weak self] (result) in
         guard let self = self else { return }
         switch result {
         case .success(let categories):
            self.categories = categories
            self.reloadData()
            break
         case .failure(let error):
            print(error)
         }
      }
      
      self.interactor.retrieveOffers { [weak self] (result) in
         guard let self = self else { return }
         switch result {
         case .success(let offers):
            self.offers = offers.sorted(by: { (firstOffer, secondOffer) -> Bool in
               return firstOffer.createdAt > secondOffer.createdAt
            })
            .sorted(by: { (firstOffer, secondOffer) -> Bool in
               return firstOffer.isUrgent && secondOffer.isUrgent != true
            })
            self.reloadData()
         case .failure(let error):
            print(error)
         }
      }
   }
   
   func didSelectItem(at indexPath: IndexPath) {
      self.wireframe.presentDetail(with: self.offers[indexPath.row])
   }
   
   func didSelect(category: Category) {
      self.wireframe.presentSearch(with: self.offers.filter { $0.categoryId == category.id },
                                   title: category.name )
   }
   
   func didTapClosedButton() {
      self.wireframe.dismiss()
   }
}
