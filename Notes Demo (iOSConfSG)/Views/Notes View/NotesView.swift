//
//  NotesView.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 7/8/23.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    
    var folder: Folder
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List {
            ForEach(folder.notes.sorted(by: { a, b in
                b.lastModified < a.lastModified
            })) { note in
                NavigationLink(destination: EditNoteView(note: note), label: {
                    NoteRowView(note: note)
                })
                .swipeActions(allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        modelContext.delete(note)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        note.isFavorite.toggle()
                    } label: {
                        Label(note.isFavorite ? "Unfavorite" : "Favorite", systemImage: note.isFavorite ? "star.slash" : "star")
                            .tint(Color.yellow)
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
            let newNote = Note(lastModified: Date(), folder: folder)
            folder.notes.append(newNote)
            folder.updateLastModified(lastModified: Date())
        }
    }
}

//#Preview {
//    NotesFolderView()
//}
