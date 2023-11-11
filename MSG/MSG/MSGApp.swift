//
//  MSGApp.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

@main
struct MSGApp: App {
    @AppStorage("onboarded") var onboarded: Bool = false
    @State var isLoading: Bool = true

    var body: some Scene {
        WindowGroup {
            if isLoading {
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    }
            } else {
                if onboarded {
                    MainView()
                } else {
                    CallingView()
                }
            }
        }
    }
}
