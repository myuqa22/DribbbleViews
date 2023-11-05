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
                Text("Switch")
                    .background(.black)
                    .foregroundColor(.budgetWhite)
                    .tag(TabBarItemType.switcher)
                Text("Profile")
                    .background(.black)
                    .foregroundColor(.budgetWhite)
                    .tag(TabBarItemType.profile)
            }
            FloatingTabBarView(selected: $selected)
        }
        .animation(.easeInOut, value: selected)
    }
}

#Preview {
    BudgetMainView()
}

struct FloatingTabBarView: View {
    
    @Namespace private var animation
    @Binding var selected: TabBarItemType
    
    var body: some View {
        
        HStack(spacing: .zero) {
            ForEach(TabBarItemType.allCases) { tabBarItemType in
                
                TabBarItem(systemName: tabBarItemType.systemName)
                    .foregroundColor(.gray)
                    .overlay {
                        if selected == tabBarItemType {
                            Circle()
                                .padding(5)
                                .foregroundColor(.budgetPurple)
                                .matchedGeometryEffect(id: "Shape", in: animation)
                                .overlay {
                                    TabBarItem(systemName: tabBarItemType.systemName)
                                        .foregroundColor(.budgetWhite)
                                }
                        }
                    }
                    .onTapGesture {
                        selected = tabBarItemType
                    }
            }
        }
        .background(.budgetBlack)
        .cornerRadius(30)
        .animation(.easeIn, value: selected)
        .padding()
    }
}

struct TabBarItem: View {
    
    let systemName: String
    let imageSize: CGFloat = 20
    let padding: CGFloat = 20
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .frame(width: imageSize, height: imageSize)
            .padding(padding)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("pexel2")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Hi Arpi")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("Monthly **Budget**")
                    .font(.title3)
                    .foregroundStyle(.budgetWhite)
            }
            Spacer()
            Button(action: {}, label: {
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 10, height: 10)
                    Text("My Balance")
                        .font(.subheadline)
                        .foregroundStyle(.budgetWhite)
                }
                .padding(10)
                .background(.budgetBlack)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray.opacity(0.5), lineWidth: 0.5)
                )
                
            })
        }
        .padding(.horizontal, 20)
    }
}

struct PlannedExpensesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("**Planned** Expenses")
                        .font(.title3)
                    HStack {
                        Text("$1,568.")
                            .font(.largeTitle)
                            .fontWeight(.bold) +
                        Text("00")
                            .font(.title3)
                    }
                    Text("$32 Left to budget")
                        .font(.subheadline)
                        .padding(10)
                        .foregroundStyle(.yellow)
                        .background(.budgetBlack)
                        .presentationCornerRadius(20)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.gray.opacity(0.5), lineWidth: 0.5)
                        )
                }
                Spacer()
                Circle()
                    .foregroundColor(.budgetBlack)
                    .frame(height: 150)
                    .overlay {
                        Text("Pie Chart")
                    }
            }
            
        }
        .padding(.horizontal, 20)
        .foregroundColor(.budgetWhite)
    }
}

struct BudgetCategoryView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.budgetPurple)
            .overlay {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Housing")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("$965.")
                        .font(.headline)
                        .fontWeight(.bold)
                    +
                    Text("00")
                        .font(.subheadline)
                    Text("61 %")
                        .font(.caption2)
                        .padding(5)
                        .background(.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .foregroundStyle(.budgetWhite)
            }
            .frame(width: 120)
    }
}

struct BudgetingExpensesView: View {
    var body: some View {
        ScrollView(.horizontal) {
            
            HStack(spacing: 10) {
                Spacer()
                    .frame(width: 10)
                Button(action: {}, label: {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 0.1)
                        .tint(.budgetBlack)
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundColor(.budgetWhite)
                        }
                        .frame(width: 40)
                })
                BudgetCategoryView()
                BudgetCategoryView()
                BudgetCategoryView()
                BudgetCategoryView()
            }
            .padding(.bottom, 20)
        }
        .frame(height: 140)
        .padding(.vertical, 20)
        .foregroundColor(.budgetWhite)
        .background(.budgetBlack)
    }
}

struct IncomeItemView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.budgetBlack)
            .frame(width: 160, height: 120)
            .overlay {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "dollarsign")
                            .foregroundColor(.budgetWhite)
                            .fontWeight(.semibold)
                            .clipShape(Circle())
                            .background(.budgetBlack)
                            .padding(8)
                            .overlay {
                                Circle().stroke(.gray, lineWidth: 0.5)
                            }
                        Spacer()
                        Image(systemName: "ellipsis")
                            .foregroundColor(.budgetWhite)
                            .fontWeight(.semibold)
                            .background(.budgetBlack)
                    }
                    Text("Salary")
                    Text("$1.500,")
                        .font(.title3)
                    +
                    Text("00")
                    Spacer()
                }
                .foregroundColor(.budgetWhite)
                .padding()
            }
    }
}

struct IncomeOverviewView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My ")
                .font(.title2)
                .foregroundStyle(.budgetWhite)
            +
            Text("Income")
                .font(.title2)
                .foregroundStyle(.gray)
            ScrollView(.horizontal) {
                HStack {
                    IncomeItemView()
                    IncomeItemView()
                    IncomeItemView()
                }
                
            }
        }
        .padding(.leading, 20)
    }
}

struct SpendingItemView: View {
    var body: some View {
        HStack {
            Image(systemName: "eurosign.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
                .background(.budgetBlack)
                .clipShape(Circle())
            Text("Spotify")
            Spacer()
            Text("$18,99")
            
        }
        .foregroundColor(.budgetWhite)
    }
}

struct SpendingOverviewView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Spending ")
                .font(.title2)
                .foregroundStyle(.budgetWhite)
            +
            Text("March")
                .font(.title2)
                .foregroundStyle(.gray)
            VStack {
                SpendingItemView()
                SpendingItemView()
                SpendingItemView()
                SpendingItemView()
            }
        }
        .padding(.horizontal, 20)
    }
}

struct BudgetView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HeaderView()
                PlannedExpensesView()
                BudgetingExpensesView()
                IncomeOverviewView()
                SpendingOverviewView()
                Spacer()
                Spacer()
                    .frame(height: 50)
            }
        }
        .background(Color.black)
    }
}
