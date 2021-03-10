//
//  OffersWireframe.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 05/03/2021.
//

import UIKit

final class OffersWireframe {
   
   // MARK: - Private properties -
   private weak var viewController: UIViewController?
   
   // MARK: - Module setup -
   
   init() {}
   
   static func instanciate(_ items: [Offer]? = nil, titleCategory: String? = nil) -> UIViewController {
      let viewController = OffersViewController()
      let interactor = OffersInteractor()
      let wireframe = OffersWireframe()
      let presenter = OffersPresenter(view: viewController,
                                      interactor: interactor,
                                      wireframe: wireframe,
                                      offers: items ?? [])
      presenter.titleCategory = titleCategory
      viewController.presenter = presenter
      wireframe.viewController = viewController
      
      return viewController
   }
   
}

// MARK: - Extensions -

extension OffersWireframe: OffersWireframeProtocol {
   func presentDetail(with item: Offer) {
      let viewController = OffersDetailWireframe.instanciate(item: item)
      viewController.modalPresentationStyle = .fullScreen
      self.viewController?.present(viewController, animated: true, completion: nil)
   }
   
   func presentSearch(with items: [Offer], title: String) {
      let viewController = OffersWireframe.instanciate(items, titleCategory: title)
      viewController.modalPresentationStyle = .fullScreen
      self.viewController?.present(viewController, animated: true, completion: nil)
   }
   
   func dismiss() {
      self.viewController?.dismiss(animated: true, completion: nil)
   }
}
