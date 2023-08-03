//
//  Item.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 3/8/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
