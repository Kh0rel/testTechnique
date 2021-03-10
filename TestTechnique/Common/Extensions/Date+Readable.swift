//
//  Date+Readable.swift
//  TestTechnique
//
//  Created by Guillaume Chieb bouares on 09/03/2021.
//

import Foundation

extension Date {
   func humanReadableDate() -> String {
      let dateFormatter = DateFormatter()
      dateFormatter.locale = Locale.current
      dateFormatter.dateFormat = "EEEE, d MMM yyyy HH:mm"
      
      return dateFormatter.string(from: self)
   }
}
