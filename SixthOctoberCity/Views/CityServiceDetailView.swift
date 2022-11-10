//
//  CityServiceDetailView.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 06/11/2022.
//

import SwiftUI

struct CityServiceDetailView: View {
    
    @State var rating : Int = 3
     let cityService:CityService
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack{
                    Image(cityService.imgURL ?? "store")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150,height: 150)
                        .padding()
                    Text(cityService.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .bold()
                        .padding()
                    VStack{
                        Spacer()
                        HStack{
                            Text("Address:")
                                .font(.headline)
                            Spacer()
                            Text(cityService.address)
                            Spacer()
                        }
                        .padding(.horizontal)
                        HStack{
                            Text("Branches:")
                                .font(.headline)
                            Spacer()
                            VStack{
                                ForEach(cityService.branches,id: \.self){branch in
                                    HStack{
                                        Text(branch)
                                        Text(",")
                                    }
                                }
                            }
                            Spacer()
                        }
                        .padding()
                        ZStack{
                            HStack{
                                Text("Rating:")
                                    .font(.headline)
                                Spacer()
                                ForEach(1..<6){index in
                                    Image(systemName: "star.fill")
                                        .font(.title3)
                                        .foregroundColor(Int(cityService.rating) >= index ? .yellow : .gray)
                                }
                                Spacer()
                                HStack {
                                    Text(String(cityService.rating))
                                        .foregroundColor(.red)
                                    Text("/ 5")
                                }
                            }
                            .padding(.horizontal)
                        }
                        Divider()
                        HStack{
                            Text("Contact:")
                                .font(.headline)
                            Spacer()
                            Link(destination: cityService.facbookURL, label: {
                                Image("facebook")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .frame(width: 80)
                            })
                            
                            Link(destination: cityService.instgramURL, label: {
                                Image("instagram")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .frame(width: 80)
                            })

                            
                            Button{
//                                let telephone = "tel://"
//                                let formattedString = telephone + String(cityService.phoneNumber)
//                                    guard let url = URL(string: formattedString) else { return }
//                                    UIApplication.shared.open(url)
                                if let url = NSURL(string: "tel://\(cityService.phoneNumber)"), UIApplication.shared.canOpenURL(url as URL){
                                    UIApplication.shared.open(url as URL)
                                }
                            }label: {
                                Image(systemName: "phone.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .frame(width: 60)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

//struct CityServiceDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityServiceDetailView()
//    }
//}
