//
//  GridView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 01/11/2022.
//

import SwiftUI

struct CategoryGridView: View {
    
    let categories = [
        Category(name: "Cinema", image: "Cinema"),
        Category(name: "Bank", image: "Bank"),
        Category(name: "Nursery", image: "Nursery"),
        Category(name: "Restaurant", image: "Restaurant"),
        Category(name: "Shopping Mall", image: "ShoppingMall"),
        Category(name: "University", image: "University"),
        Category(name: "School", image: "School"),
        Category(name: "Gym", image: "Gym"),
        Category(name: "Fashion", image: "Fashion")
    ]
    let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 3)
    @State var moreButton:Bool = false
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:columns,spacing: 10){
                ForEach(categories){cat in
                    CategoryStyleView(category: cat)
                }
            }
            .padding()
        }
        .background(Color.white)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
    }
}
