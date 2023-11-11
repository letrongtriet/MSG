//
//  CallingView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI
import AVKit

struct CallingView: View {
    @State var isButtonDisabled: Bool = true
    let video = AVPlayer(url:  Bundle.main.url(forResource: "call_from_jog", withExtension: "mp4")!)

    @State var shouldCharaterList: Bool = false

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                VideoPlayer(player: video)
                    .disabled(true)
                    .frame(width: geo.size.width, height: geo.size.height)

                Button {
                    video.pause()
                    shouldCharaterList = true
                } label: {
                    Color.clear
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 165)
                }
                .disabled(isButtonDisabled)
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                video.play()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                isButtonDisabled = false
            }
        }
        .onDisappear {
            video.pause()
        }
        .fullScreenCover(isPresented: $shouldCharaterList) {
            AskingHelpView()
        }
    }
}

#Preview {
    CallingView()
}
