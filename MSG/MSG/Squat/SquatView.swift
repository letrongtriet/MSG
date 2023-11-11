//
//  SquatView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI
import SceneKit
import ARKit
import CoreMotion

struct SquatView: View {
    @AppStorage("squatOnboarded") var onboarded: Bool = false
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
                EducationVideoView(fileName: "education_1")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
                            dismiss()
                        }
                    }
            } else {
                if onboarded {
                    ZStack {
                        MilkContainer()
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
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
                                        showFact = true
                                    }
                                }
                        }
                    }
                    .onAppear {
                        startGameCountDown()
                    }
                } else {
                    EducationVideoView(fileName: "tutorial_1")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
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

            let gravY = abs(myData.gravity.y)
            let userY = myData.userAcceleration.y

            if gravY > 0.4 {
                if userY < -0.9 {
                    print("Squat: \(userY)")
                    sound.prepareToPlay()
                    sound.play()
                } else if userY > 0.9 {
                    print("Jump: \(userY)")
                    sound.prepareToPlay()
                    sound.play()
                }
            }
        }
    }
}

#Preview {
    SquatView()
}
