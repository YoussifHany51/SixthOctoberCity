//
//  CityServiceListView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 03/11/2022.
//

import SwiftUI

struct CityServiceListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm:CityServiceViewModel
    @Binding var name:String
    @Binding var image:String
    
    var body: some View {
        NavigationStack {
            VStack{
                CategoryTitle
                List{
                    ForEach(vm.filterList(text: name, cityServiceList: vm.cityService)){cityServ in
                        NavigationLink(destination:CityServiceDetailView(cityService: cityServ)){
                            HStack{
                                Image(cityServ.imgURL ?? "store")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70,height: 70)
                                VStack(spacing: 7){
                                    Text(cityServ.name)
                                        .bold()
                                        .padding(.top)
                                    HStack{
                                        Text("Address:")
                                        Text(cityServ.address)
                                    }
                                    HStack {
                                        Text("rating:")
                                        Text(String(cityServ.rating))
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                            .foregroundColor(.primary)
                        }
                    }
                }
            }
            .overlay(BackButton,alignment: .topLeading)
        }
    }
}

struct CityServiceListView_Previews: PreviewProvider {
    static var previews: some View {
        CityServiceListView(name: .constant("Gym"),image: .constant("store"))
            .environmentObject(CityServiceViewModel())
    }
}


extension CityServiceListView{
    private var BackButton: some View{
        Button{
            presentationMode.wrappedValue.dismiss()
        } label:{
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
    
    private var CategoryTitle:some View{
//        ZStack (alignment: .bottom){
            VStack(spacing: 5){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .cornerRadius(20)
                
                HStack{
                    Text(name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .padding()
//                    Spacer()
                }
            }
//        }
    }
    
}
