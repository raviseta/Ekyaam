//
//  DateExtension.swift
//  Ekyamm
//
//  Created by Ravi Seta on 04/12/2024.
//

import Foundation

public extension Date {
    
    func format(as format : Format) -> String {
        return self.format(as: format.rawValue)
    }
    
    func format(as format : String?) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    enum Format: String {
        case dayMonthYearHour = "dd MMM, yyyy hh:mm a"
        case dayMonthYearWithSpaces = "dd MMM, yyyy"
        case weekDayAndMonth = "EEEE, dd MMM"
        case hourMinDayMonthYear = "h:mm a, dd MMM yyyy"
        case hh_mm_a = "hh:mm a"
        case yearMonthDayTimestamp = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        case yearMonthDay = "yyyy-MM-dd"
        case weekDay = "EEE"
        case hourMinDayMonth = "hh:mm a,dd MMM"
        case day = "dd"
        case dayMonth = "dd MMM"
        case dayDateMonth = "EE, dd MMM"
    }
}
