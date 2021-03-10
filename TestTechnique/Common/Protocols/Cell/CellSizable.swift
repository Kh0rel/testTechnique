//
//  ContentSizable.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import Foundation
import UIKit

protocol CellSizable: class {
   static func size(with content: FormattedModelProtocol, fitting size: CGSize, at indexPath: IndexPath) -> CGSize
}
