//
//  Date+Today.swift
//  Today
//
//  Created by Hamed Hashemi on 8/27/23.
//

import Foundation

/// WE CREATED DATE STRINGS HERE BUT I HAVE TO FIGURE OUT EXATCLY WHAT HAPPENED lol
///
/// 1. we extended the date class to present custom date string when  calling the dayAndTimeText or dayText
extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened) /// Example: 11:02 PM
        /// if its today
        if Locale.current.calendar.isDateInToday(self) {
            let timeForamt = NSLocalizedString("Today at %@" , comment: "Today at time format string")
            return String(format: timeForamt, timeText)
        } else { /// if its not today
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
    
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
