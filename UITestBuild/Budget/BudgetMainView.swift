//
//  BudgetMainView.swift
//  UITestBuild
//
//  Created by Privat on 04.11.23.
//
// Design from Dribbble
// Link: https://dribbble.com/shots/21023422-Budget-Finance-App

import SwiftUI

enum TabBarItemType: Identifiable, Hashable, CaseIterable {
    
    var id: TabBarItemType {
        self
    }
    
    case overview
    case switcher
    case profile
    
    var systemName: String {
        return switch self {
        case .overview: "chart.pie"
        case .switcher: "arrow.left.arrow.right"
        case .profile: "person"
        }
    }
}

struct BudgetMainView: View {
    
    @State var selected = TabBarItemType.overview
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selected) {
                BudgetView()
                    .toolbar(.hidden, for: .tabBar)
                    .tag(TabBarItemType.overview)
                Text("Switcher")
                    .foregroundColor(.budgetWhite)
                    .toolbar(.hidden, for: .tabBar)
                    .tag(TabBarItemType.switcher)
                Text("Profile")
                    .foregroundColor(.budgetWhite)
                    .toolbar(.hidden, for: .tabBar)
                    .tag(TabBarItemType.profile)
            }
            FloatingTabBarView(selected: $selected)
                .animation(.easeIn, value: selected)
        }
        .animation(.easeInOut, value: selected)
    }
}

struct SwitchView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 20) {
            header
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Spending ")
                            .font(.title2)
                            .foregroundStyle(.budgetWhite)
                        +
                        Text("March")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                        Text("$744,")
                            .font(.title3)
                            .foregroundStyle(.gray)
                        +
                        Text("97")
                            .foregroundStyle(.gray)
                    }
                    HStack(spacing: 2) {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.budgetPurple)
                            .frame(width: 100, height: 14)
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.budgetBabyBlue)
                            .frame(width: 50, height: 14)
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.budgetWhite)
                            .frame(width: 70, height: 14)
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.budgetBlack)
                            .frame(height: 14)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading) {
                        Text("This ")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        +
                        Text("Month")
                            .font(.title2)
                            .foregroundStyle(.budgetWhite)
                        VStack(spacing: 20) {
                            SpendingItemView()
                            SpendingItemView()
                            SpendingItemView()
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Last ")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        +
                        Text("Month")
                            .font(.title2)
                            .foregroundStyle(.budgetWhite)
                        VStack(spacing: 20) {
                            SpendingItemView()
                            SpendingItemView()
                            SpendingItemView()
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 10)
                Spacer()
            }
        }
        .background(Color.black)
    }
    
    var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("My Balance")
                Text("$8,822.")
                    .font(.largeTitle)
                +
                Text("00")
                HStack {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("+8%")
                }
                .font(.subheadline)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .foregroundColor(.budgetWhite)
            Spacer()
            VStack(alignment: .center) {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.budgetBlack)
                    .overlay {
                        Image(systemName: "xmark")
                            .foregroundColor(.budgetWhite)
                    }
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
            }
        }
        .frame(height: 140)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background {
            LinearGradient(
                gradient: Gradient(colors: [.black, .budgetBlack]),
                startPoint: .top,
                endPoint: .bottom)
        }
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
}

#Preview {
    BudgetMainView()
}

private struct SpendingItemView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "eurosign.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
                .background(.budgetBlack)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 10) {
                Text("Spotify")
                    .fontWeight(.semibold)
                Text("10:00 am · Mar 26th 2023")
            }
            
            Spacer()
            Text("$18,")
                .font(.title3)
                .fontWeight(.semibold)
            +
            Text("99")
            
        }
        .foregroundColor(.budgetWhite)
    }
}
