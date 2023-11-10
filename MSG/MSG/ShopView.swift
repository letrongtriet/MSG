//
//  ShopView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

struct ShopView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let data = (1...16).map { "Shop item \($0)" }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .foregroundStyle(.white)
                            .frame(
                                width: (geo.size.width - (16 * 2) - 16) / 2,
                                height: 180
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                .yellow,
                                                .orange
                                            ],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                            )
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    ShopView()
}
