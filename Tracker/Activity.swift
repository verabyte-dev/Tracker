//
//  Activity.swift
//  Tracker
//
//  Created by Jeffrey Williams on 3/15/20.
//  Copyright © 2020 Jeffrey Williams. All rights reserved.
//

import Foundation

/// Activity properties
struct Activity: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var counter: Int = 0
}
