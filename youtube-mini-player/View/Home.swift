//
//  Home.swift
//  youtube-mini-player
//
//  Created by Susumu Hoshikawa on 2024/02/24.
//

import SwiftUI

struct Home: View {
    @State private var activeTab: Tab = .home
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab) {
                homeTabView()
                    .setupTab(.home)
                Text(Tab.shorts.rawValue)
                    .setupTab(.shorts)
                Text(Tab.subscriptions.rawValue)
                    .setupTab(.subscriptions)
                Text(Tab.you.rawValue)
                    .setupTab(.you)
            }
            .padding(.bottom, tabBarHeight)
            
            customTabBar()
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    /// Home Tab
    @ViewBuilder
    func homeTabView() -> some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(items) {item in
                        playerItemCardView(item)
                    }
                }
                .padding(16)
            }
            .navigationTitle("Youtube")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.background, for: .navigationBar)
        }
    }
    
    @ViewBuilder
    func playerItemCardView(_ item: PlayerItem) -> some View {
        VStack(alignment: .leading, spacing: 6.0) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
    
    /// カスタムタブバー.
    @ViewBuilder
    private func customTabBar() -> some View {
        HStack(spacing: 0.0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                VStack(spacing: 4.0) {
                    Image(systemName: tab.symbol)
                        .font(.title3)
                    Text(tab.rawValue)
                        .font(.caption2)
                }
                .foregroundStyle(activeTab == tab ? Color.primary : .gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(.rect)
                .onTapGesture {
                    activeTab = tab
                }
            }
        }
        .frame(height: 49)
        .overlay(alignment: .top) {
            Divider()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(height: tabBarHeight)
        .background(.background)
    }
}

extension View {
    @ViewBuilder
    func setupTab(_ tab: Tab) -> some View {
        self.tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
    
    var safeArea: UIEdgeInsets {
        if let safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets {
            return safeArea
        }
        
        return .zero
    }
    
    var tabBarHeight: CGFloat {
        return 49 + safeArea.bottom
    }
}

#Preview {
    ContentView()
}

