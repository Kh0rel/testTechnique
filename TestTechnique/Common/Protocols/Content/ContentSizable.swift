//
//  ContentSizable.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 06/03/2021.
//

import Foundation
import UIKit

protocol ContentSizable: class {
   /// Computes the size, the content will need to fit within passed size
   ///
   /// - Parameters:
   ///   - content: Data object
   ///   - size: collectionView bounds
   ///   - indexPath: indexPath of the item
   /// - Returns: the item size fitting the containing size
   static func size(with content: String, fitting size: CGSize, at indexPath: IndexPath) -> CGSize
}
