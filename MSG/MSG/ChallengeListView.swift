//
//  ChallengeListView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

struct ChallengeListView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let data = (1...16).map { "Challenge \($0)" }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(data, id: \.self) { item in
                        Button {
                            
                        } label: {
                            Text(item)
                                .frame(
                                    width: (geo.size.width - (16 * 2) - 16) / 2,
                                    height: 240
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(
                                            LinearGradient(
                                                colors: [
                                                    .pink.opacity(0.7),
                                                    .purple
                                                ],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    ChallengeListView()
}
