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
   
   static func instanciate() -> UIViewController {
      let viewController = OffersViewController()
      let interactor = OffersInteractor()
      let wireframe = OffersWireframe()
      let presenter = OffersPresenter(view: viewController, interactor: interactor, wireframe: wireframe)
      viewController.presenter = presenter
      wireframe.viewController = viewController
      
      return viewController
   }
   
}

// MARK: - Extensions -

extension OffersWireframe: OffersWireframeProtocol {
   func presentDetail(with item: String) {
      let viewController = OffersDetailWireframe.instanciate()
      viewController.modalPresentationStyle = .fullScreen
      self.viewController?.present(viewController, animated: true, completion: nil)
   }
}
