//
//  UserModel.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
//

import Foundation

struct WeeklyProgressModel: Equatable, Hashable {
    let monday: Double
    let tuesday: Double
    let wednesday: Double
    let thursday: Double
    let friday: Double
    let saturday: Double
    let sunday: Double
    
}
struct UserModel: Identifiable, Equatable, Hashable  {
    let id: UUID
    let firstName: String
    let lastName: String
    let location: String
    let books: Int
    let followers: Int
    let shelves: Int
    let weeklyProgress: WeeklyProgressModel
}

extension UserModel {
    
    static let mock = UserModel(id: UUID(),
                                firstName: "Anne",
                                lastName: "Hall",
                                location: "London, UK",
                                books: 122,
                                followers: 4503,
                                shelves: 44,
                                weeklyProgress: WeeklyProgressModel(
                                    monday: 30,
                                    tuesday: 40,
                                    wednesday: 50,
                                    thursday: 60,
                                    friday: 50,
                                    saturday: 40,
                                    sunday: 30))
}
