//
//  AddActivityView.swift
//  Tracker
//
//  Created by Jeffrey Williams on 3/15/20.
//  Copyright © 2020 Jeffrey Williams. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var name = ""
    @State private var description = ""
    @State private var isShowingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing:
                Button("Save") {
                    self.saveActivity()
            })
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func saveActivity() {
        guard !name.isEmpty else {
            alertTitle = "Error!"
            alertMessage = "Please enter a name for your activity."
            isShowingAlert = true
            return
        }
        
        let activity = Activity(name: self.name, description: self.description)
        self.activities.items.append(activity)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
