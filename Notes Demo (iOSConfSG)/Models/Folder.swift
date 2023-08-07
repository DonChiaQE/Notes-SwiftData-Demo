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
    var uuid: UUID = UUID()
    var dateCreated: Date = Date()
    @Attribute(.unique)
    var folderName: String
    @Relationship(.cascade, inverse: \Note.folder)
    var notes: [Note] = []
    
    init(folderName: String) {
        self.folderName = folderName
    }
}
