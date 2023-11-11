//
//  EducationalView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI

struct EducationalView: View {
    let item: EducationDialogItem
    
    var body: some View {
        ZStack {
            Color(.white.withAlphaComponent(0.3))
                .ignoresSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Congratulations, you just earned")
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    
                    Text("10 coins")
                        .font(.system(size: 55, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                    
                    Text(item.fact)
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                colors: [
                                    .pink.opacity(0.7),
                                    .purple,
                                    .yellow
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
                .padding([.vertical, .horizontal])
            }
        }
    }
}

#Preview {
    EducationalView(item: .repeatChallenge)
}
