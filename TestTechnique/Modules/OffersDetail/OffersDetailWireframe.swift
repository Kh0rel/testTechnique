//
//  OffersDetailWireframe.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import UIKit

final class OffersDetailWireframe {

    // MARK: - Private properties -
   private weak var viewController: UIViewController?
    // MARK: - Module setup -
   
   static func instanciate(item: Offer) -> UIViewController {
      let viewController = OffersDetailViewController()
      let wireframe = OffersDetailWireframe()
      let interactor = OffersDetailInteractor()
      let presenter = OffersDetailPresenter(view: viewController,
                                            interactor: interactor,
                                            wireframe: wireframe,
                                            offer: item)
      viewController.presenter = presenter
      wireframe.viewController = viewController
      
      return viewController
   }

}

// MARK: - Extensions -

extension OffersDetailWireframe: OffersDetailWireframeProtocol {
   
   func dismiss() {
      self.viewController?.dismiss(animated: true, completion: nil)
   }
}
