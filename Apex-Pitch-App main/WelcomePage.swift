//
//  WelcomePage.swift
//  Apex-Pitch-App main
//
//  Created by Pride Mafira  on 18/12/2025.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("appIcon2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 350)
                    .cornerRadius(20)
                    .foregroundStyle(.tint)
                Text("Welcome to Apex Pitch")
                    .font(.largeTitle)
                    .bold()
//                    .padding()
                
                Text("From first idea to First Investor!")
                    .font(.system(size: 23))
                    .padding()
            }
            .padding()
            
            NavigationLink {
               SignIn_Page()
            } label: {
                Text("Get Started!")
                    .padding()
                    .font(.title)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .buttonStyle(.bordered)
                    .padding()
            }
        }
    }
}

#Preview {
    WelcomePage()
}
