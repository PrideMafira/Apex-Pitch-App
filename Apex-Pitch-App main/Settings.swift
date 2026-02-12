//
//  Settings.swift
//  Apex-Pitch-App main
//
//  Created by Pride Mafira  on 18/12/2025.
//

import SwiftUI

struct Settings: View {
    @State private var Email = ""
    @State private var Password = ""
    var body: some View {
        NavigationStack{
            VStack {
                Spacer(minLength: 280)
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Personal Information")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer(minLength: 70)
                
                HStack {
                    Text("Email:")
                        .padding()
                        .font(.headline)
                        .fontWeight(.bold)
                        .italic()
                    Spacer()
                }
                
                        TextField("", text: $Email)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(10)
                            .padding()
                            
                    
                
                HStack {
                    Text("Password:")
                        .padding()
                        .font(.headline)
                        .fontWeight(.bold)
                        .italic()
                    
                    Spacer()
                }
                
                TextField("", text: $Password)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(3)
                    .padding()
                    
                Spacer(minLength: 200)
                
                NavigationLink(destination: TabPage()){
                    Image(systemName: "house.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                       
                        .foregroundColor(.black)
                }
                .offset(x: -150)
            }
                Spacer(minLength: 250)
        }
    }
}

#Preview {
    Settings()
}
