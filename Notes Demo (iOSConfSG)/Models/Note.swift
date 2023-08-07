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
    var uuid: UUID = UUID()
    var content: String = ""
    var lastModified: Date
    var folder: Folder?
    
    init(lastModified: Date, folder: Folder) {
        self.lastModified = lastModified
        self.folder = folder
    }
}
