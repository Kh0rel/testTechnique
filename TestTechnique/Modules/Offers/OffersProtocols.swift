//
//  OffersProtocols.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 05/03/2021.
//

import UIKit

protocol OffersWireframeProtocol: class {
   func presentDetail(with item: String)
}

protocol OffersViewProtocol: class {
}

protocol OffersPresenterProtocol: class {
   func didSelectItem(at indexPath: IndexPath)
}

protocol OffersInteractorProtocol: class {
}
