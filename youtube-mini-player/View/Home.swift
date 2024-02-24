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
                Text(Tab.home.rawValue)
                    .setupTab(.home)
                Text(Tab.shorts.rawValue)
                    .setupTab(.shorts)
                Text(Tab.subscriptions.rawValue)
                    .setupTab(.subscriptions)
                Text(Tab.you.rawValue)
                    .setupTab(.you)
            }
        }
    }
}

extension View {
    @ViewBuilder
    func setupTab(_ tab: Tab) -> some View {
        self.tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ContentView()
}

