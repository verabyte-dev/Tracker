//
//  Activities.swift
//  Tracker
//
//  Created by Jeffrey Williams on 3/15/20.
//  Copyright © 2020 Jeffrey Williams. All rights reserved.
//

import Foundation

/// Data class for automatic saves to UserDefaults and reads
class Activities: ObservableObject {
    @Published var items: [Activity] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
