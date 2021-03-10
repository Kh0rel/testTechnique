//
//  Section.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 07/03/2021.
//

import Foundation

struct Section<T> {
   var header: String?
   
   var items: [T] = []
   init(header: String? = nil, items: [T]) {
      self.header = header
      self.items = items
   }
}
