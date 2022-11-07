//
//  TopRatingListView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 05/11/2022.
//

import SwiftUI

struct TopRatingListView: View {
    
    @EnvironmentObject var vm : CityServiceViewModel
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(vm.topRatingList) { item in
                    GeometryReader {geometry in
                        ZStack(alignment: .top) {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.white)
                                .rotation3DEffect(Angle(degrees:Double(geometry.frame(in: .global).minX) / -20), axis: (x: 0, y: 1, z: 0))
                            NavigationLink(destination:CityServiceDetailView(cityService: item)){
                                VStack{
                                    Image(item.imgURL ?? "store")
                                        .resizable()
                                        .scaledToFit()
                                    Spacer()
                                    VStack{
                                        Text(item.name)
                                            .foregroundColor(.black)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                            .frame(height: 10)
                                        HStack{
                                            Text("rate:")
                                                .foregroundColor(.black)
                                            Text("5 /")
                                                .foregroundColor(.black)
                                            Text(String(item.rating))
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                        
                    }
                    .shadow(color: .black.opacity(0.2), radius: 10,y: 5)
                    .frame(width: 250,height: 270)
                }
            }
            .padding()
        }
    }
}




struct TopRatingListView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatingListView()
            .environmentObject(CityServiceViewModel())
    }
}
