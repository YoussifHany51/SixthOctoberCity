//
//  CityServiceViewModel.swift
//  SixthOctoberCity
//
//  Created by Youssif Hany on 31/10/2022.
//

import Foundation
class CityServiceViewModel : ObservableObject{
    @Published var searchText:String = ""
    @Published var topRatingList:[CityService] = []
    @Published var categories = [
        Category(name: "Cinema", image: "Cinema"),
        Category(name: "Bank", image: "Bank"),
        Category(name: "Nursery", image: "Nursery"),
        Category(name: "Restaurant", image: "Restaurant"),
        Category(name: "Shopping Mall", image: "ShoppingMall"),
        Category(name: "University", image: "University"),
        Category(name: "School", image: "School"),
        Category(name: "Gym", image: "Gym"),
        Category(name: "Fashion", image: "Fashion"),
        Category(name: "Hospital", image: "Hospital")
    ]
    
    @Published var cityService = [
        CityService(name: "Hoda hospital", address: "1th district", branches: ["Mohandsin","Alex","October"], category: "Hospital", imgURL: "hodaHospital", facbookURL: "https/facbook.com", instgramURL: "https/instagram.com", phoneNumber: 0103445345, rating: 3.5),
        CityService(name: "Galaxy cinema", address: "Hossary", branches: ["October","Manial"], category: "Cinema", imgURL: "galaxyCinema", facbookURL: "https/facbook.com", instgramURL: "https/instagram.com", phoneNumber: 0103445345, rating: 2),
        CityService(name: "Golds gym", address: "7th district", branches: ["Rehab","October","Alex","Zamalek","Zayed"], category: "Gym", imgURL: "goldsGym", facbookURL: "https/facbook.com", instgramURL: "https/instgaram.com", phoneNumber: 0103445345, rating: 5),
        CityService(name: "Pioneer international school", address: "8th district", branches: ["October","Mohandsinn","Nasr city"], category: "School", imgURL: "pioneerSchool", facbookURL: "https/facbook.com", instgramURL: "https/instgaram.com", phoneNumber: 0103445345, rating: 4),
    ]
    
        func filterList(text:String , cityServiceList:[CityService]) -> [CityService]{
        guard !text.isEmpty else{
            return cityServiceList
        }
        
        let lowerCased = text.lowercased()
        
        return cityServiceList.filter { (cityServiceList) -> Bool in
            return cityServiceList.name.lowercased().contains(lowerCased)
        }
    }
    
    func getTopRating(cityServiceList:[CityService]){
       let sortedList = cityServiceList.sorted(by: { $0.rating > $1.rating })
        for rate in 0..<3{
            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                self.topRatingList.append(sortedList[rate])
            }
        }
    }
}
