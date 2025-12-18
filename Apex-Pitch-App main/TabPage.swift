//
//  TabPage.swift
//  Apex-Pitch-App main
//
//  Created by Pride Mafira  on 18/12/2025.
//

import SwiftUI
enum Types: String{
    case concepts = "Concepts"
    case prototype = "Prototype"
    case funded = "Funded"
}

struct Idea: Identifiable {
    var id = UUID()
    var startupName: String
    var ideaDescription: String
    var fundingGoal: String
    var fundingRaised: String
    var type: Types
}

struct TabPage: View {
    @State private var selectedTab: Types = .concepts
    @State private var ideas: [Idea] = []
    
    let tabs: [Types] = [.concepts, .prototype, .funded]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                // --- Top Tab Bar ---
                HStack {
                    ForEach(tabs, id: \.self) { tab in
                        Button {
                            selectedTab = tab
                        } label: {
                            VStack(spacing: 4) {
                                Text(tab.rawValue)
                                    .font(.headline)
                                    .foregroundColor(selectedTab == tab ? .blue : .gray)
                                
                                Rectangle()
                                    .fill(selectedTab == tab ? Color.blue : Color.clear)
                                    .frame(height: 3)
                                    .cornerRadius(1.5)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.top, 8)
                .background(Color(.systemGray6))
                .shadow(radius: 1)
                
                // --- Display Selected View ---
                ScrollView {
                    ForEach(ideas.filter({$0.type == selectedTab})) { idea in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 150)
                            .overlay {
                                VStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("Startup name: \(idea.startupName)")
                                        Text("Idea description: \(idea.ideaDescription)")
                                        Text("Funding goal: \(idea.fundingGoal)")
                                        Text("Funding raised: \(idea.fundingRaised)")
                                            .font(.default)
                                    }
                                    .padding()
                                }
                                .padding(.horizontal)
                                //to nice out the view you use stacks inside
                                //to display the more things you use the .ideadescription
                            }
                    }
                    .padding(.top)
                }
               
                NavigationLink{
//                    Add_Idea_Page(ideas: $ideas)
                }label: {
                    Label("Create", systemImage: "plus")
                        .padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    TabPage()
}
