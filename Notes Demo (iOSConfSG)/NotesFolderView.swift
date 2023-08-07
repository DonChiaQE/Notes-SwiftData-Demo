//
//  NotesFolderView.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 7/8/23.
//

import SwiftUI
import SwiftData

struct NotesFolderView: View {
    
    var folder: Folder
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List {
            ForEach(folder.notes.sorted(by: { notes, note in
                note.lastModified < notes.lastModified
            })) { note in
                NavigationLink {
                    EditNoteView(note: note)
                } label: {
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
                }.swipeActions {
                    Button(role: .destructive) {
                        modelContext.delete(note)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }

                }
            }
        }
        .navigationTitle(Text(folder.folderName))
        .toolbar {
            ToolbarItem(placement: .bottomBar, content: {
                HStack {
                    Button(action: createNote) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.blue)
                            Text("New Note")
                                .font(.system(.body, design: .rounded).bold())
                                .foregroundColor(.blue)
                        }
                    }
                    Spacer()
                }
                .buttonStyle(.plain)
            })
        }
    }
    
    private func createNote() {
        withAnimation {
            let newNote = Note(content: "", lastModified: Date(), folder: folder)
            folder.notes.append(newNote)
        }
    }
}

//#Preview {
//    NotesFolderView()
//}
