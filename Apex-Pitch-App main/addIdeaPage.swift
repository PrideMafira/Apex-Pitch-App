//
//  addIdea.swift
//  Apex-Pitch-App main
//
//  Created by Pride Mafira  on 18/12/2025.
//

import SwiftUI
import Combine

import SwiftUI

enum Types: String, CaseIterable {
    case concepts = "Concept"
    case prototype = "Prototype"
    case funded = "Funded"
}

struct Idea {
    let startupName: String
    let ideaDescription: String
    let fundingGoal: String
    let fundingRaised: String
    let type: Types
}


struct addIdeaPage: View {
    @State private var Startup_name = ""
    @State private var Description: String = ""
    @State private var selectedStage: Types = .concepts
    @State private var Stages: [Types] = [.concepts, .prototype, .funded]
    @State private var Funding_Goal = ""
    @State private var Funding_Raised = ""
    @Environment(\.dismiss) var dismiss
    @Environment(\.dismiss) var dismiss2
    
    @Binding  var ideas: [Idea]
  
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Startup Name:")
                        .padding()
                    Spacer()
                }
                
                TextField("Enter your startup name", text: $Startup_name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3)
                    .padding()
                
                HStack {
                    Text("Idea description:")
                        .padding()
                    Spacer()
                }
                
                TextEditor(text: $Description)
                    .frame(height: 100)
                    .border(Color.gray)
                    .cornerRadius(3)
                    .padding()
                
                Picker("Stages", selection: $selectedStage) {
                    ForEach($Stages, id: \.self) { $stage in
                        Text(stage.rawValue)
                    }
                }
                .pickerStyle(.navigationLink)
                .padding()
                
                HStack {
                    Text("Funding Goal($):")
                        .padding()
                    Spacer()
                }
                
                TextField("e.g 10000", text: $Funding_Goal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3)
                    .padding()
                
                HStack {
                    Text("Funding Raised($):")
                        .padding()
                    Spacer()
                }
                
                TextField("e.g 10", text: $Funding_Raised)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(3)
                    .padding()
                
                Spacer()
                
                HStack {
                    Button {
                        dismiss2()
                    } label: {
                        Text("Cancel")
                                                  
                            .offset(x: 150)
                            .padding()
                        Spacer()
                        
                    }
                    .padding()
                    
                    HStack {
                        HStack {
                            //not allowing a user to save an idea without entering information
                            if !Startup_name.isEmpty && !Description.isEmpty && !Funding_Goal.isEmpty && !Funding_Raised.isEmpty {
                                
                            
                            Button {
                                let newIdea = Idea(startupName: Startup_name, ideaDescription: Description, fundingGoal: Funding_Goal, fundingRaised: Funding_Raised, type: selectedStage)
                                ideas.append(newIdea)
                                print("ideas")
                                dismiss()
                            } label: {
                                Text("Add Idea")
                                    .padding()
                           
                            }
                            .padding(20)
                            .offset(x: -50)
                        }
                           
                            
                        }
                        
                    }
                    
                    }
                }

            }
        
        }
    
}

#Preview {
    addIdeaPage(ideas: .constant([]))
}
