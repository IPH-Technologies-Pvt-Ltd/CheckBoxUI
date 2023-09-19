//
//  DropDown.swift
//  CellView
//
//  Created by iPHTech38 on 23/08/23.
//

import SwiftUI

struct DropDown: View {
    @State var checked = false
    @State var dataloaded = true
    let column = [ GridItem(.flexible(minimum: 10), spacing: 0),
                   GridItem(.flexible(minimum: 10))]
    
    private let pitems: [String] = ["All Data"]
    
    @Binding var flag: Bool
    @Binding var storedArray: [String] // Pass the storedArray as a binding
    @State var selecteddata: [String] = []
    
    var body: some View {
        VStack {
            ForEach(pitems, id: \.self) { pitem in
                VStack {
                    if selecteddata.contains(pitem) {
                        HStack {
                            
                            Text("\(pitem)")
                                .font(.system(size: 20))
                                .foregroundColor(Color.gray)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.up")
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                        }.contentShape(Rectangle())
                            .onTapGesture {
                                self.flag = false
                                let item = pitem
                                selecteddata.removeAll(where: { $0 == item })
                            }.padding(.horizontal, 10)
                    }
                    else {
                        HStack {
                            
                            Text("\(pitem)")
                                .font(.system(size: 20))
                                .foregroundColor(Color.gray)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                            
                            Spacer()
                            
                            Image(systemName:"chevron.down" )
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                        }.contentShape(Rectangle())
                            .onTapGesture {
                                self.flag = false
                                selecteddata.append(pitem)
                                
                            }.padding(.horizontal, 10)
                    }
                    
                    if selecteddata.contains(pitem) {
                        
                        Divider().background(Color.orange).frame(height:1)
                        
                        LazyVGrid(columns: column) {
                            ForEach(storedArray, id: \.self) { item in
                                BoxView(content: item, checked: $checked, dataloaded: $dataloaded) { deletedContent in
                                    // Handle the deletion of 'deletedContent' from 'storedArray'
                                    if let index = storedArray.firstIndex(of: deletedContent) {
                                        storedArray.remove(at: index)
                                    }
                                }
                            }.padding(.bottom, 10)
                        }
                    }
                }.overlay(
                    RoundedRectangle(cornerRadius: 10).strokeBorder(Color.orange, lineWidth: 1))
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white))
                .padding(.horizontal, 15)
            }
        }.onChange(of: storedArray) { _ in
            // React to changes in the storedArray
            // You can update your view or perform any necessary actions here
        }
    }
}


