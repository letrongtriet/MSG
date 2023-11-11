//
//  MainView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

enum MainViewItem: CaseIterable {
    case home
    case challenge
    case community
    case shop

    var title: String {
        switch self {
        case .home:
            "Home"
        case .challenge:
            "Challenges"
        case .community:
            "Community"
        case .shop:
            "Shop"
        }
    }

    var icon: String {
        switch self {
        case .home:
            "home"
        case .challenge:
            "game"
        case .community:
            "community"
        case .shop:
            "shop"
        }
    }
}

struct MainView: View {
    @State var item: MainViewItem = .challenge

    var body: some View {
        ZStack {
            switch item {
            case .home:
                HomeView()
            case .challenge:
                ChallengeListView()
            case .community:
                CommunityView()
            case .shop:
                ShopView()
            }

            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    ForEach(MainViewItem.allCases, id: \.self) { item in
                        Button {
                            self.item = item
                        } label: {
                            VStack(spacing: 8) {
                                Image(item.icon)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(
                                        LinearGradient(
                                            colors: [
                                                .pink.opacity(0.7),
                                                .purple,
                                                .yellow
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )

                                Text(item.title)
                                    .font(.system(size: 12, weight: .semibold))
                                    .overlay {
                                        LinearGradient(
                                            colors: [
                                                .pink.opacity(0.7),
                                                .purple,
                                                .yellow
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                        .mask(
                                            Text(item.title)
                                                .font(.system(size: 12, weight: .semibold))
                                        )
                                    }
                            }
                            .padding(4)
                            .background(
                                ZStack {
                                    if self.item == item {
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(
                                                LinearGradient(
                                                    colors: [
                                                        .pink.opacity(0.7),
                                                        .purple,
                                                        .yellow
                                                    ],
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                ),
                                                lineWidth: 1.5
                                            )
                                    } else {
                                        Color.clear
                                    }
                                }
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 36)
                .background(
                    Capsule()
                        .fill(.white)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    .pink.opacity(0.7),
                                    .purple,
                                    .yellow
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 4
                        )
                )
            }
        }
    }
}

#Preview {
    MainView()
}
