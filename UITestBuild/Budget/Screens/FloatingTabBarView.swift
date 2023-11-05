//
//  FloatingTabBarView.swift
//  UITestBuild
//
//  Created by Privat on 05.11.23.
//

import SwiftUI

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

#Preview {
    FloatingTabBarView(selected: .constant(.overview))
}
