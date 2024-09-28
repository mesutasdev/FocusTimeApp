//
//  SplashScreen.swift
//  FocusTime
//
//  Created by Mesut As Developer on 9/21/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
    
            Color.yellow.opacity(0.7)
                .ignoresSafeArea()
         
                
            
            VStack (alignment: .center, spacing: 75){
                
                Spacer()
     
                
                Image(systemName: "moon.stars.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("You are in the right place to focus!")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                Text("FocusTime")
                    .font(.largeTitle)
                
                
                Spacer()
     
               
               
            }
      
            
        }
        
    }
}

#Preview {
    SplashScreen()
}
