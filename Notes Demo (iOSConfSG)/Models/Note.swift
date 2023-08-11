//
//  Note.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 3/8/23.
//

import Foundation
import SwiftData

@Model
final class Note {
    var uuid: UUID
    var content: String
    var isFavorite: Bool
    var lastModified: Date
    var folder: Folder?
    
    init(lastModified: Date, folder: Folder) {
        self.uuid = UUID()
        self.content = ""
        self.isFavorite = false
        self.lastModified = lastModified
        self.folder = folder
    }
}
