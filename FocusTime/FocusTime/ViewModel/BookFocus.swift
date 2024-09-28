//
//  BookFocus.swift
//  FocusTime
//
//  Created by Mesut As Developer on 9/28/24.
//


import SwiftUI

struct BookFocus: View {
    
    @State private var focusTime: Int = 2100 // 25 minutes (for seconds)
    @State private var timer: Timer?
    @State private var isActive = false
    @State private var timeRemaining = 2100 // for back remaining
    
    @State private var showAlert = false // Alert Control
    
   
    
    var body: some View {
        ZStack {
            // Background Color
            Color.purple.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                ZStack {
                    Circle()
                        .strokeBorder(Color.purple.opacity(0.6), lineWidth: 50)
                        .frame(width: 300, height: 300, alignment: .top)
                    
                    // Focus shower time
                    Text(timeString(time: timeRemaining))
                        .foregroundColor(Color.primary)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .bold()
                }
                
                Spacer()
                
                Image(systemName: "book")
                    .resizable()
                    .frame(width: 130, height: 100)
                    .padding()
                
                TypewriterText(text: "Book Focus")
                
                Spacer()
                
                // Timer buttons for control
                HStack {
                    // Start and stop button
                    Button {
                        if isActive {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    } label: {
                        Text(isActive ? "Pause" : "Start")
                            .frame(width: 120, height: 50)
                            .background(isActive ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        resetTimer()
                    } label: {
                        Text("Reset")
                            .frame(width: 120, height: 50)
                            .background(.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("You did it!"),
                message: Text("You have completed your focus time. Are you ready for the next one?"),
                primaryButton: .default(Text("Reboot")) {
                    resetTimer() // Yeniden başlat
                },
                secondaryButton: .cancel(Text("OK")) {
                    resetTimer()
                }
            )
        }
    }
    
    // Start timer
    func startTimer() {
        isActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                pauseTimer()
                showAlert = true // Süre bitince uyarı göster
              
            }
        }
    }
    
    // Timer stop
    func pauseTimer() {
        isActive = false
        timer?.invalidate()
        timer = nil
    }
    
    // Timer reset
    func resetTimer() {
        isActive = false
        pauseTimer()
        timeRemaining = focusTime
    }
    
    // Zamanı dakika ve saniye formatına çevirme
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
}


#Preview {
    BookFocus()
}





