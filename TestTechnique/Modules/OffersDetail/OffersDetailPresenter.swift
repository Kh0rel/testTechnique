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

    // MARK: - Lifecycle -

    init(view: OffersDetailViewProtocol, interactor: OffersDetailInteractorProtocol, wireframe: OffersDetailWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension OffersDetailPresenter: OffersDetailPresenterProtocol {
   func didTapClosedButton() {
      self.wireframe.dismiss()
   }
}
