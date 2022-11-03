//
//  GridView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 01/11/2022.
//

import SwiftUI

struct CategoryGridView: View {
    
    @EnvironmentObject var vm:CityServiceViewModel
    let columns = Array(repeating: GridItem(.flexible(),spacing: 10),count: 3)
    @State var isPresented:Bool = false
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:columns,spacing: 10){
                ForEach(vm.categories){cat in
                    Button{
                        isPresented.toggle()
                    }label: {
                        CategoryStyleView(category: cat)
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $isPresented, content: {
            
        })
        .background(Color.white)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .environmentObject(CityServiceViewModel())
    }
}
