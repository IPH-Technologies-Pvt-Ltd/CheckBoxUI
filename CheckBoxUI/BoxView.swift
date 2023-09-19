//
//  BoxView.swift
//  CellView
//
//  Created by iPHTech38 on 23/08/23.
//

import SwiftUI

struct BoxView: View {
    
    let content: String
    @Binding var checked: Bool
    @Binding var dataloaded: Bool
    var onDelete: (String) -> Void // Closure property for deletion, accepts a String parameter

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous).strokeBorder(checked ? Color.orange : Color.orange, lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(checked ? Color.orange : .white))
                    .frame(minWidth: 100, maxWidth: 185, minHeight: 40)
                    .onTapGesture {
                       
                    }
                HStack {
                    
                    Text(content)
                        .font(.system(size: 20))
                        .foregroundColor(checked ? .white : .orange)
                        .multilineTextAlignment(.leading)
                        .onTapGesture {
                            
                        }
                        .onAppear {
                            
                        }
                    Image(systemName: checked ? "xmark.circle" : "xmark.circle")
                        .foregroundColor(checked ? .white : .orange)
                        .onTapGesture {
//                            self.checked.toggle()
                            onDelete(content) // Pass the content to onDelete when tapped

                        }
                }.padding(.leading,9)
                    .padding(.trailing,9)
            }.fixedSize()
        }.onAppear {
            
        }
    }
}
