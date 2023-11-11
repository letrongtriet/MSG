//
//  EducationVideoView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI
import AVKit

struct EducationVideoView: View {
    let fileName: String

    var video: AVPlayer {
        let player = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: "mp4")!)
        player.play()
        return player
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                VideoPlayer(player: video)
                    .disabled(true)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    EducationVideoView(fileName: "education_1")
}
