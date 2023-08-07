//
//  EditNoteView.swift
//  Notes Demo (iOSConfSG)
//
//  Created by Don Chia on 3/8/23.
//

import SwiftUI
import SwiftData

struct EditNoteView: View {
    
    @Bindable var note: Note
    
    @FocusState var keyboardInputState: Bool
    
    var body: some View {
        TextEditor(text: $note.content)
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: note.content) {
                note.lastModified = Date()
            }
            .onAppear(perform: {
                keyboardInputState = true
            })
            .focused($keyboardInputState)
            .toolbar {
                if keyboardInputState {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button("Done") {
                            keyboardInputState = false
                        }
                    })
                }
            }
    }
}

//#Preview {
//    EditNoteView(note: Note(content: "Hello World!", lastModified: Date()))
//}
