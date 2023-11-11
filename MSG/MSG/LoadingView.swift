//
//  LoadingView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI

struct LoadingView: View {
    @State var progressValue: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 12) {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 150)

                ProgressView(value: progressValue, total: 100)
                    .tint(.teal.opacity(0.7))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .animation(.bouncy, value: progressValue)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            progressValue = 100
                        }
                    }
                    .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .background(
            Image("homeBackground")
                .resizable()
                .ignoresSafeArea(.all)
        )
    }
}

#Preview {
    LoadingView()
}
