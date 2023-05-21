//
//  Date+ext.swift
//  WorkoutApp
//
//  Created by Павел Лахно on 21.05.2023.
//

import UIKit

extension Date {
    private var calendar: Calendar {
        Calendar.current
    }
    
    var startOfWeek: Date {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        guard let firstDay = calendar.date(from: components) else { return self }
        return calendar.date(byAdding: .day, value: 1, to: firstDay) ?? self
    }
    
    func moveForward(to days: Int) -> Date {
        calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    func stripDate() -> Date {
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components) ?? self
    }
}
