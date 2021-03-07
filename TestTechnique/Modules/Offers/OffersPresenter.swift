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
   
   // MARK: - Lifecycle -
   
   init(view: OffersViewProtocol, interactor: OffersInteractorProtocol, wireframe: OffersWireframeProtocol) {
      self.view = view
      self.interactor = interactor
      self.wireframe = wireframe
   }
}

// MARK: - Extensions -

extension OffersPresenter: OffersPresenterProtocol {
   func didSelectItem(at indexPath: IndexPath) {
      self.wireframe.presentDetail(with: String(describing: indexPath.row))
   }
}
