//
//  HomeView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 31/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm : CityServiceViewModel
    @State var moreButton:Bool = true
    let rows = Array(repeating: GridItem(.flexible(),spacing: 10),count: 1)
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes
        = [.foregroundColor:UIColor.init(.red)]
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    VStack{
                        UpperText
                        SearchBarView(searchText: $vm.searchText)
                            ForEach(vm.filterList(
                                text: vm.searchText,
                                cityServiceList: vm.cityService)){cityServ in
                                    if !vm.searchText.isEmpty{
                                        HStack{
                                            Image(cityServ.imgURL ?? "store")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40,height: 40)
                                            Text(cityServ.name)
                                        }
                                    }
                            }
                        CategoryGridView(moreButton: $moreButton)
                        MoreButtonSection
                        TopRatingTitle
                            .onAppear{
                                vm.getTopRating(cityServiceList: vm.cityService)
                            }
                        //TopRatingSection
//                        ForEach(vm.topRatingList){rate in
//                            Text(rate.name)
//                        }
                        TopRatingListView()
                    }
                }
                .navigationTitle("Discover")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination:AddNewCityServiceView()){
                            Image(systemName: "plus.circle")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination:ContactUsView()) {
                            Image(systemName: "phone")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CityServiceViewModel())
    }
}

extension HomeView{
    
    private var UpperText:some View{
        HStack {
            Text("any thing in 6th October city")
                 .padding(.leading)
                 .foregroundColor(.gray)
            Spacer()
        }
    }
    
    private var TopRatingTitle:some View{
        HStack{
            HStack{
                Text("Top Rating")
                Image(systemName: "star.fill")
            }
            .foregroundColor(.white)
            .font(.headline)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)
                    .frame(width: 130,height: 40))
            .padding(.horizontal)
            Spacer()
        }
        .padding(.top)
    }
    
    private var MoreButtonSection : some View{
        Button{
            withAnimation(.easeIn(duration: 1)){
                moreButton.toggle()
            }
            
        }label: {
            Spacer()
            HStack{
                Image(systemName: moreButton ? "plus.circle.fill":"minus.circle.fill")
                Text(moreButton ? "More":"less")
                    .underline()
            }
            .foregroundColor(.red)
            .font(.headline)
            .padding(.horizontal)
            .rotationEffect(Angle(degrees: moreButton ? 0 : 360))
        }
        .padding()
    }
}
