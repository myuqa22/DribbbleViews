//
//  DummyBookView.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
//

import SwiftUI

struct DummyBookView: View {
    
    let book: BookModel
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .fill(.ultraThinMaterial)
            .frame(width: 130, height: 200)
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 4, y: 10)
            .overlay {
                Text(book.title)
                    .foregroundStyle(.black)
            }
    }
    
}

#Preview {
    DummyBookView(book: BookModel.mock)
}
