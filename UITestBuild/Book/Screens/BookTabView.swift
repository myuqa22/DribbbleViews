//
//  BookTabView.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
// 

import SwiftUI

struct BookTabView: View {
    
    @State var text: String = String()
    @State var path: [BookTrackingPath] = []
    @State var isEditing = false {
        didSet {
            searchIsActive = isEditing
        }
    }
    @FocusState var searchIsActive: Bool
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: .zero) {
                if !searchIsActive {
                    HStack {
                        Text("FRIDAY 6 NOVEMBER")
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .tint(.bookOrangeForeground)
                                .foregroundColor(.bookOrangeForeground)
                                .frame(width: 25, height: 25)
                        })
                    }
                    .padding(.horizontal, 20)
                    Text("In Progress")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                }
                
                HStack {
                    TextField("Search ...", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .onSubmit {
                            self.isEditing = false
                        }
                        .focused($searchIsActive)
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
                            self.searchIsActive = false
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                    }
                }
                .padding(10)
                .animation(.smooth, value: searchIsActive)
                ScrollView {
                    DummyBookCaruselView(title: nil,
                                         books: [BookModel.mock,
                                                 BookModel.mock,
                                                 BookModel.mock]) { book in
                        path.append(.bookDetail(book))
                    }
                    
                    DummyBookCaruselView(title: "Next up",
                                         books: [BookModel.mock,
                                                 BookModel.mock,
                                                 BookModel.mock]) { book in
                        path.append(.bookDetail(book))
                    }
                    
                    DummyBookCaruselView(title: "Recommended",
                                         books: [BookModel.mock,
                                                 BookModel.mock,
                                                 BookModel.mock]) { book in
                        path.append(.bookDetail(book))
                    }
                    Spacer()
                }
                
            }
            .navigationDestination(for: BookTrackingPath.self) { path in
                switch path {
                case let .bookDetail(book):
                    BookDetailView(book: book)
                }
            }
        }
    }
}

#Preview {
    BookTabView()
}
