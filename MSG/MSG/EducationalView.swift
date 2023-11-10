//
//  EducationalView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI

struct EducationalView: View {
    @Environment(\.dismiss) var dismiss
    
    let item: EducationDialogItem
    
    var body: some View {
        ZStack {
            Color(.white.withAlphaComponent(0.15))
                .ignoresSafeArea(.all)
            
            Text(item.fact)
                .font(.headline)
                .multilineTextAlignment(.center)
                .overlay {
                    LinearGradient(
                        colors: [
                            .pink.opacity(0.7),
                            .purple,
                            .yellow
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .mask(
                        Text(item.fact)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    )
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    .pink.opacity(0.7),
                                    .purple,
                                    .yellow
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 4
                        )
                )
                .padding([.vertical, .horizontal])
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                dismiss()
            }
        }
    }
}

#Preview {
    EducationalView(item: .milk)
}
