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
    var dateCreated: Date
    @Attribute(.unique) var folderName: String
    @Relationship(.cascade, inverse: \Note.folder) var notes: [Note] = []
    
//    var notes: [Note] {
//        get { self.notes_ ?? [] }
//        set { self.notes_ = newValue  }
//    }
    
    init(folderName: String) {
        self.uuid = UUID()
        self.dateCreated = Date()
        self.folderName = folderName
    }
}
