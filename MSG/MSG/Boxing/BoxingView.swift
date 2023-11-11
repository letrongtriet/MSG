//
//  BoxingView.swift
//  MSG
//
//  Created by Triet Le on 11.11.2023.
//

import SwiftUI
import SceneKit
import ARKit
import CoreMotion

struct BoxingView: View {
    @AppStorage("boxingOnboarded") var onboarded: Bool = false
    @State var countDown: Int = 3
    @State var gameCountdown: Int = 20

    @State var shouldGameCountdown: Bool = false
    @State var shouldRepeatToEarn: Bool = false

    @State var showFact: Bool = false

    @Environment(\.dismiss) var dismiss

    let motionManager = CMMotionManager()

    let sound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "ding", withExtension: "mp3")!)
    let completeSound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "challenge_complete", withExtension: "mp3")!)

    var body: some View {
        GeometryReader { geo in
            if showFact {
                EducationVideoView(fileName: "education_3")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 13) {
                            dismiss()
                        }
                    }
            } else {
                if onboarded {
                    ZStack {
                        WaterContainer()
                            .frame(width: geo.size.width, height: geo.size.height)

                        if countDown > 0 {
                            Text("\(countDown)")
                                .font(.system(size: 100, weight: .bold))
                                .foregroundStyle(.mint.gradient)
                        }

                        if shouldGameCountdown {
                            VStack {
                                Text("\(gameCountdown)")
                                    .font(.system(size: 100, weight: .bold))
                                    .foregroundStyle(.mint.gradient)
                                    .padding(.top, 32)

                                Spacer()
                            }
                        }

                        if shouldRepeatToEarn {
                            EducationalView(item: .repeatChallenge)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                        showFact = true
                                    }
                                }
                        }
                    }
                    .onAppear {
                        startGameCountDown()
                    }
                } else {
                    EducationVideoView(fileName: "tutorial_3")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                                onboarded = true
                            }
                        }
                }
            }
        }
        .ignoresSafeArea(.all)
    }

    func startGameCountDown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            countDown -= 1
            if countDown == 0 {
                timer.invalidate()
                startGame()
            }
        }
    }

    func startGame() {
        shouldGameCountdown = true

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            gameCountdown -= 1

            if gameCountdown == 0 {
                timer.invalidate()
                shouldGameCountdown = false
                motionManager.stopDeviceMotionUpdates()
                completeSound.prepareToPlay()
                completeSound.play()
                shouldRepeatToEarn = true
            }
        }

        motionManager.deviceMotionUpdateInterval = 1/60
        motionManager.startDeviceMotionUpdates(to: .main) { data, error in
            if let error {
                print("Error: \(error.localizedDescription)")
            }

            guard let myData = data else {
                return
            }

            let userY = abs(myData.userAcceleration.z)

            if userY > 1.2 {
                sound.prepareToPlay()
                sound.play()
            }
        }
    }
}

#Preview {
    BoxingView()
}
