//
//  FocusTimeApp.swift
//  FocusTime
//
//  Created by Mesut As Developer on 9/21/24.
//

import SwiftUI

@main
struct FocusTimeApp: App {
    
    @State var ispresented = true
    
    var body: some Scene {
        WindowGroup {
            
            if ispresented{
                SplashScreen()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            ispresented = false
                        }
                    }
                
            }else {
                MainView()
            }
            
        }
    }
}
