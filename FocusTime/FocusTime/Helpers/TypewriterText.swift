//
//  TypewriterText.swift
//  FocusTime
//
//  Created by Mesut As Developer on 9/28/24.
//


import SwiftUI

struct TypewriterText: View {
    let text: String
    @State private var displayedText = ""
    @State private var charIndex = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(displayedText)
            .font(.title)
            .onReceive(timer) { _ in
                if charIndex < text.count {
                    let index = text.index(text.startIndex, offsetBy: charIndex)
                    displayedText.append(text[index])
                    charIndex += 1
                }
            }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            TypewriterText(text: "Odaklanmak için en doğru yerdesin!")
                .padding()
        }
    }
}

//@main
struct TypewriterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
