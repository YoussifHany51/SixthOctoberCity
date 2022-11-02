//
//  HomeView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 31/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm : CityServiceViewModel
    
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
                         Spacer()
                        SearchBarView(searchText: $vm.searchText)
                        CategoryGridView()
                    }
                }
                .navigationTitle("Discover")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            
                        }label: {
                            Image(systemName: "plus.circle")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            
                        }label: {
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
}
