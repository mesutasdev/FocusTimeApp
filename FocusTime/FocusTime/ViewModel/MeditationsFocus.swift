//
//  MeditationsFocus.swift
//  FocusTime
//
//  Created by Mesut As Developer on 9/28/24.
//

import SwiftUI

struct MeditationsFocus: View {
    
    @State private var focusTime: Int = 300 // 25 minutes (for seconds)
    @State private var timer : Timer?
    @State private var isActive = false
    @State private var timeRemaining = 300 // for back remaining
    
    @State private var showAlert = false // Alert Control
    
    
    var body: some View {
        
        ZStack {
//            backgroundColor
            Color.green.opacity(0.2)
                .ignoresSafeArea()
            VStack{
                
                Spacer()
           
                ZStack{
                    Circle()
                        .strokeBorder(Color.green.opacity(0.5),lineWidth: 50)
                        .frame(width: 300, height: 300, alignment: .top)
                      
                    
                    //        Focus shower time
                    Text(timeString(time: timeRemaining))
                        .foregroundColor(Color.textMy)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .bold()
              
                }
                
                Spacer()
                
                Image(systemName: "figure.mind.and.body")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
            
        
                TypewriterText(text: "Meditations Focus")
                
                
                
                Spacer()
                
                //           timer buttons for control
                HStack{
                    //                start and stop button
                    Button {
                        if isActive{
                            pauseTimer()
                        }else{
                            startTimer()
                        }
                    } label: {
                        Text(isActive ? "Pause" : "Start")
                            .frame(width: 120, height: 50)
                            .background(isActive ? Color.red : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        resetTimer()
                    } label: {
                        Text("Reset")
                            .frame(width: 120, height: 50)
                            .background(.green)
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
                secondaryButton: .cancel(Text("OK")){
                    resetTimer()
                }
            )
        }

      
    }
    
    // Start timer
    func startTimer(){
        isActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else {
                pauseTimer()
//                buraya süre bitince uyarı eklenebilir
                showAlert = true
                print("Focus time over!")
            }
            
        }
        
    }
    
//    timer stop
    func pauseTimer() {
        isActive = false
        timer?.invalidate()
        timer = nil
    }
    
//    timer reset
    func resetTimer(){
        isActive = false
        pauseTimer()
        timeRemaining = focusTime
    }

    // zamanı dakika ve saniye formatına çevirme
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds )
    }
}



#Preview {
    MeditationsFocus()
}
