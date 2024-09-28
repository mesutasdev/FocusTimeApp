//
//  ShowAlert.swift
//  FocusTime
//
//  Created by Mesut As Developer on 9/28/24.
//

import SwiftUI

struct ShowAlert: View {
    
    @State private var showAlert = false
    
    var body: some View {
        Button("Tap to show alert") {
            showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Unable to Save Workout Data"),
                message: Text("The connection to the server was lost."),
                primaryButton: .default(
                    Text("Try Again")
                    
                ),
                secondaryButton: .destructive(
                    Text("Delete")
                    
                )
            )
        }
    
    }
}

#Preview {
    ShowAlert()
}



