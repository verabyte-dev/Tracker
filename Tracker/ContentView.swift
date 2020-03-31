//
//  ContentView.swift
//  Tracker
//
//  Created by Jeffrey Williams on 3/15/20.
//  Copyright © 2020 Jeffrey Williams. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(destination: ActivityDetailView(activities: self.activities, activity: item)) {
                        Text("\(item.name):  \(item.counter)")
                                .font(.headline)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: self.activities)
            }
            .navigationBarTitle("Tracker")
            .navigationBarItems(leading:
                EditButton()
                    .font(.headline),
                                trailing:
                Button(action: {
                    self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
                        .font(.headline)
                }
            )
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
