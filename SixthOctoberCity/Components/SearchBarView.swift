//
//  SearchBarView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 31/10/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText:String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                        .red : .primary)
            
            TextField("Search here",text: $searchText)
                .foregroundColor(.primary)
                .disableAutocorrection(false)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(.primary)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            dismissKeyBoard()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.15),
                        radius: 10, x: 0, y: 0))
        .padding()
    }
    }


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}


extension View{
    func dismissKeyBoard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),to: nil,from: nil,for: nil)
    }
}
