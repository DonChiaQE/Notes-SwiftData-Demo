//
//  Folder.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 7/8/23.
//

import Foundation
import SwiftData

@Model
final class Folder {
    var uuid: UUID
    var lastModified: Date
    @Attribute(.unique)
    var folderName: String
    @Relationship(deleteRule: .cascade, inverse: \Note.folder) var notes: [Note]
    
    init(lastModified: Date, folderName: String) {
        self.uuid = UUID()
        self.lastModified = lastModified
        self.folderName = folderName
        self.notes = []
    }
    
    func updateLastModified(lastModified: Date) {
        self.lastModified = lastModified
    }
}
