//
//  NoteRowView.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 10/8/23.
//

import SwiftUI

struct NoteRowView: View {
    
    var note: Note
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.content.isEmpty ? "New Note" : note.content)
                    .font(.headline)
                    .lineLimit(1)
                Text(note.lastModified, format: Date.FormatStyle()
                    .day(.twoDigits)
                    .month(.twoDigits)
                    .year(.twoDigits)
                )
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            Spacer()
            if note.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

//#Preview {
//    NotesFolderRowView(note: Note(lastModified: Date(), folder: Folder(folderName: "Test")))
//}
