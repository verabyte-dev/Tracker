//
//  ActivityDetailView.swift
//  Tracker
//
//  Created by Jeffrey Williams on 3/15/20.
//  Copyright © 2020 Jeffrey Williams. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activities: Activities
    @State private var counter = 0
    var activity: Activity
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(alignment: .leading) {
                Text("Description:")
                    .font(.body)
                    .foregroundColor(Color.secondary)
                
                Text(activity.description)
                    .font(.title)
                    .foregroundColor(Color.primary)
            }
            
            VStack(spacing: 20) {
                Text("Counter:  \(activity.counter)")
                    .font(.title)
                    .foregroundColor(Color.primary)
                
                Button(action: { self.incrementCounter() }) {
                    Text("Increment Counter")
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(.infinity)
                }
            }
            Spacer()
        }
        .navigationBarTitle("\(activity.name)")
    }
    
    init(activities: Activities, activity: Activity) {
        self.activities = activities
        self.activity = activity
    }
    
    /// Increments activity counter
    func incrementCounter() {
        counter = activity.counter
        counter += 1
        updateActivities()
    }
    
    /// Updates Activity
    func updateActivities() {
        if let index = activities.items.firstIndex(where: { $0.id == activity.id }) {
            var item = activities.items[index]
            item.counter = counter
            activities.items.remove(at: index)
            activities.items.insert(item, at: index)
        } else {
            print("Error! - Could not locate activity in activities!")
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static let activity = Activity(name: "Test Activity", description: "This is just a test.")
    static var previews: some View {
        ActivityDetailView(activities: Activities(), activity: activity)
    }
}
