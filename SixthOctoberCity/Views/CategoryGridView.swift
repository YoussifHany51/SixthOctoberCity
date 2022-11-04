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
    @State var cityServiceName:String = ""
    @State var cityServiceImage:String = ""
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:columns,spacing: 10){
                ForEach(vm.categories){cat in
                    Button{
                        isPresented.toggle()
                        cityServiceName = cat.name
                        cityServiceImage = cat.image
                    }label: {
                        CategoryStyleView(category: cat)
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $isPresented, content: {
            VStack {
                CityServiceListView(name: $cityServiceName,image: $cityServiceImage)
            }
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
