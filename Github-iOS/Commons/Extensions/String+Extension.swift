//
//  String+Extension.swift
//  Github-iOS
//
//  Created by Gabriel on 19/03/25.
//

import Foundation

extension String {
    func toDayMonthYearFormat() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: self) else { return nil }
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
