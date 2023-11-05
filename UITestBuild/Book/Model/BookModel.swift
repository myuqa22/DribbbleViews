//
//  BookModel.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
//

import SwiftUI

enum BookProgress: String {
    case finished = "FINISHED"
    case progress = "IN PROGRESS"
    case none
    
    var color: UIColor {
        return switch self {
        case .finished: .green
        case .progress: .bookOrangeForeground
        case .none: .black
        }
    }
    
    var icon: Image? {
        return switch self {
        case .finished: Image(systemName: "checkmark.circle")
        case .progress: Image(systemName: "clock.fill")
        case .none: nil
        }
    }
    
    var background: UIColor {
        switch self {
        case .finished: return .white
        case .progress: return .bookOrangeBackground
        case .none: return .white
        }
    }
}

enum BookGenre: String {
    case health = "Health"
    
    var image: Image {
        switch self {
        case .health:
            return Image(systemName: "heart.text.square")
        }
    }
}

struct BookModel: Identifiable, Equatable, Hashable {
    
    let id: UUID
    let title: String
    let author: String
    let progress: BookProgress
    let description: String
    let genre: BookGenre
    let released: Date
    let length: Int
    let publisher: String
}

extension BookModel {
    static let mock: BookModel = BookModel(
        id: UUID(),
        title: "Das Buch",
        author: "Die Authorin",
        progress: .progress,
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        genre: .health,
        released: Date(),
        length: 400,
        publisher: "The Publisher")
    
}
