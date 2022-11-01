//
//  CategoryStyleView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 02/11/2022.
//

import SwiftUI

struct CategoryStyleView: View {
    
    let category:Category
    
    var body: some View {
        GeometryReader{reader in
            VStack(spacing:5){
                Image(category.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                
                Text(category.name)
                    .font(.system(size: 16,weight: .bold,design: .rounded))
                    .foregroundColor(.black.opacity(0.9))
            }
            .frame(width: reader.size.width,height: reader.size.height)
            .background(Color.white)
        }
        .frame(height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.2), radius: 10,y: 5)
    }
}
