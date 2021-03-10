//
//  String+TextFormatting.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 09/03/2021.
//

import Foundation

extension String {
   var descriptionFormat: String {
      
      return self
         .replacingOccurrences(of: ". ", with: ".\n")
         .replacingOccurrences(of: " - ", with: "\n- ")
         .replacingOccurrences(of: "  !", with: " !\n")
         .replacingOccurrences(of: " : ", with: ":\n")
   }
}
