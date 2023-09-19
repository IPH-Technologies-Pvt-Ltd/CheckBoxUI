//
//  ContentView.swift
//  CellView
//
//  Created by iPHTech38 on 21/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var addText = ""
    @State private var flag = false
    @State private var storedArray = ["First", "Second"]
    
    var body: some View {
        VStack {
            addBar(addText: $addText, onCommit: { newValue in
                if !newValue.trimmingCharacters(in: .whitespaces).isEmpty {
                    storedArray.append(newValue)
                    flag.toggle() // Toggle the flag to refresh the DropDown view
                }
                addText = ""
            })
            .frame(height: 70)
            DropDown(flag: $flag, storedArray: $storedArray) // Pass the storedArray as a binding
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
