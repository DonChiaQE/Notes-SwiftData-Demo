//
//  Notes_Demo__iOSConfSG_App.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 3/8/23.
//

import SwiftUI
import SwiftData

@main
struct Notes_Demo__iOSConfSG_App: App {
    var body: some Scene {
        WindowGroup {
            FoldersView()
        }
        .modelContainer(for: [Folder.self, Note.self])
    }
}
