//
//  AskingHelpView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI
import AVKit

struct AskingHelpView: View {
    @State var isButtonDisabled: Bool = true
    let video = AVPlayer(url: Bundle.main.url(forResource: "asking_help_jog", withExtension: "mp4")!)
    let sound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ding", withExtension: "mp3")!)

    @State var shouldCharaterList: Bool = false

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                VideoPlayer(player: video)
                    .disabled(true)
                    .frame(width: geo.size.width, height: geo.size.height)

                Button {
                    video.pause()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        sound.play()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                        shouldCharaterList = true
                    }
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
                isButtonDisabled = false
            }
        }
        .onDisappear {
            video.pause()
        }
        .fullScreenCover(isPresented: $shouldCharaterList) {
            ChooseYourCharacterView()
        }
    }
}

#Preview {
    AskingHelpView()
}
