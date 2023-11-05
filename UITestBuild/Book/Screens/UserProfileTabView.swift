//
//  UserProfileTabView.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
//

import SwiftUI

struct UserProfileTabView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    let user: UserModel = UserModel.mock
    
    enum MenuItem: String, CaseIterable {
        case review = "Review"
        case history = "History"
        case statistics = "Statistics"
        case wishlist = "Wishlist"
        
        var systemImageName: String {
            switch self {
            case .review:
                return "star.fill"
            case .history:
                return "clock.fill"
            case .statistics:
                return "books.vertical.fill"
            case .wishlist:
                return "wand.and.stars"
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).ignoresSafeArea()
        
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    UpperView(user: user)
                    Divider()
                    ProfileNumbersView(user: user)
                    Spacer()
                }
                .padding(.top, safeAreaInsets.top)
                .padding(.horizontal, 20)
                .background(.white)
            
                LastWeekProgressView(user: user)
                    .padding(.vertical, 20)
               
                VStack(spacing: 1) {
                    ForEach(MenuItem.allCases, id: \.rawValue) { menuItem in
                        MenuItemView(menuItem: menuItem)
                    }
                   
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    UserProfileTabView()
}

struct UpperView: View {
    
    let user: UserModel
    
    var body: some View {
        HStack {
            VStack {
                Image("pexel")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .padding(.trailing, 20)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(user.firstName + " " + user.lastName)
                    .font(.title)
                    .fontWeight(.bold)
                HStack(spacing: 5) {
                    Image(systemName: "location")
                    Text(user.location)
                }
                .font(.title3)
                .foregroundColor(.gray)
                Button(action: {}, label: {
                    Text("EDIT")
                        .padding(10)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .background(.bookOrangeBackground)
                        .foregroundColor(.bookOrangeForeground)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                })
            }
            Spacer()
        }
    }
}

struct ProfileNumbersView: View {
    
    let user: UserModel
    
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                Text("BOOKS")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("\(user.books)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            Divider()
            VStack(spacing: 10) {
                Text("FOLLOWERS")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("\(user.followers)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            Divider()
            VStack(spacing: 10) {
                Text("SHELVES")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("\(user.shelves)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ProgressBarView: View {
    
    let progress: Double
    let weekdayPrefix: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 8)
                    .foregroundStyle(.gray.opacity(0.1))
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 8, height: progress)
                    .foregroundStyle(.bookOrangeForeground)
            }
            .frame(height: 100)
            Text(weekdayPrefix)
                .foregroundStyle(.gray)
        }
    }
}

struct LastWeekProgressView: View {
    
    let user: UserModel
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading) {
                Spacer()
                Text("LAST WEEK")
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                    .font(.subheadline)
                Text("5 hours")
                    .font(.title)
            }
            Group {
                ProgressBarView(progress: user.weeklyProgress.monday, weekdayPrefix: "M")
                ProgressBarView(progress: user.weeklyProgress.tuesday, weekdayPrefix: "T")
                ProgressBarView(progress: user.weeklyProgress.wednesday, weekdayPrefix: "W")
                ProgressBarView(progress: user.weeklyProgress.thursday, weekdayPrefix: "D")
                ProgressBarView(progress: user.weeklyProgress.friday, weekdayPrefix: "R")
                ProgressBarView(progress: user.weeklyProgress.saturday, weekdayPrefix: "S")
                ProgressBarView(progress: user.weeklyProgress.sunday, weekdayPrefix: "S")
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(10)
    }
}

struct MenuItemView: View {
    
    let menuItem: UserProfileTabView.MenuItem
    
    var body: some View {
        Button(action: {}, label: {
            HStack {
                Image(systemName: menuItem.systemImageName)
                    .foregroundColor(.gray)
                Text(menuItem.rawValue)
                    .font(.title3)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(15)
            .background(.white)
        })
        .tint(.black)
    }
}
