//
//  addBar.swift
//  CellView
//
//  Created by iPHTech38 on 22/08/23.
//

import SwiftUI
struct addBar: View {
    @Binding var addText: String
    var onCommit: (String) -> Void
    
    var body: some View {
        ZStack {
            HStack {
                TextField("Add Data", text: $addText, onCommit: {
                    onCommit(addText)
                    addText = "" // Clear the text field after commit
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .onTapGesture {
                        addText = ""
                    }
            }
            .padding(.horizontal)
        }
    }
}



