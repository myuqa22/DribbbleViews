//
//  DummyBookCaruselView.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
//

import SwiftUI

struct DummyBookCaruselView: View {
    
    let title: String?
    let books: [BookModel]
    let didTapBook: (BookModel) -> Void
    
    var body: some View {
        if let title {
            Text(title)
                .font(.title2)
                .padding(.top, 10)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        if !books.isEmpty {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    Spacer()
                        .frame(width: .zero)
                    ForEach(books) { book in
                        DummyBookView(book: book)
                            .onTapGesture {
                                didTapBook(book)
                            }
                    }
                }
                .padding(.top, 15)
                .padding(.bottom, 20)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    DummyBookCaruselView(title: "Titel", books: [BookModel.mock, BookModel.mock]) { book in
        print(book)
    }
}
