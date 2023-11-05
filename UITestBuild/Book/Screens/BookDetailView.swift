//
//  BookDetailView.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: BookModel
    
    @State var descriptionLineLimit: Int? = 3
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                upper
                    .padding(.horizontal, 20)
                Divider()
                    .padding(.horizontal, 20)
                description
                    .padding(.horizontal, 20)
                Divider()
                    .padding(.horizontal, 20)
                info
                Divider()
                    .padding(.horizontal, 20)
                Text("Highlights")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                Spacer()
                
            }
        }
    }
    
    var upper: some View {
        HStack(spacing: 20) {
            DummyBookView(book: book)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(book.author)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                HStack {
                    book.progress.icon
                    Text(book.progress.rawValue)
                }
                .padding(5)
                .font(.subheadline)
                .fontWeight(.bold)
                .background(.bookOrangeBackground)
                .foregroundColor(.bookOrangeForeground)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "ellipsis.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                .tint(.bookOrangeForeground)
            }
        }
    }
    
    var description: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.title)
                .fontWeight(.bold)
            Text(book.description)
                .foregroundStyle(.gray)
                .lineLimit(descriptionLineLimit)
            HStack {
                Spacer()
                Button {
                    descriptionLineLimit = descriptionLineLimit == nil ? 3: nil
                } label: {
                    Text(descriptionLineLimit == nil ? "Less": "More")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
                Spacer()
            }
        }
        .animation(.linear, value: descriptionLineLimit)
    }
    
    var info: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                Spacer()
                    .frame(width: 0)
                VStack(spacing: 5) {
                    Text("GENRE")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    book.genre.image
                        .fontWeight(.bold)
                        .font(.title3)
                    Text(book.genre.rawValue)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Divider()
                    .frame(height: 50)
                VStack(spacing: 5) {
                    Text("RELEASED")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text(book.released, format: .dateTime.year())
                        .fontWeight(.bold)
                        .font(.title3)
                    Text(book.released, format: .dateTime.day().month())
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Divider()
                    .frame(height: 50)
                VStack(spacing: 5) {
                    Text("LENGTH")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text("\(book.length)")
                        .fontWeight(.bold)
                        .font(.title3)
                    Text("Pages")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Divider()
                    .frame(height: 50)
                VStack(spacing: 5) {
                    Text("PUBLISHER")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text(book.publisher)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }

            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BookDetailView(book: BookModel.mock)
}
