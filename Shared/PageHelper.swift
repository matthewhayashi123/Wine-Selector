import Foundation
import SwiftUI
/*
 Contains all the randomization and supporting calculations
 https://blckbirds.com/post/how-to-navigate-between-views-in-swiftui-by-using-an-observableobject/
 */
class StateKeeper: ObservableObject{
    @Published var currentPage: Page = .page0
    @Published var regionValue: String = " "
    @Published var typeValue:  String = " "
    @Published var varietalValue: String = " "
    
    var randomInt: Int
    var wines: [Wine]
    init(){
        
        wines = loadCSV(from:"Wines")
        let lenWines = wines.count
        randomInt = Int.random(in: 0...lenWines)
    }
    func region() -> Void{
        self.regionValue = wines[self.randomInt].country
    }
    
    func varietal() -> Void{
        self.varietalValue = wines[self.randomInt].variety
    }
    
}

//Creates own Page type
enum Page{
    case page0
    case page1
    case page2
    case page3
    case page4
}

//Randomly selects type of wine: Red or White
func redOrWhite() -> String{

    let wineTypes = [0: "Red Wine",
                     1: "White Wine"]
    
    let type:String = wineTypes[Int.random(in: 0...1)]! // ! -> force unwrap
    
    return type
}

//Randomly selects region of wine
func region() -> String{

    let wineRegion = [0: "Italy",
                      1: "France",
                      2: "California",
                      3: "Spain",
                      4: "Australia",
                      5: "New York",
                      6: "Oregon"]
    
    let type:String = wineRegion[Int.random(in: 0...6)]!
    
    return type
}

/*
 Randomly selects varietal of wine
 For future updates: currently only supports three varietals per region per type
 -Randomization is only for values 0...3
 -Needs different logic if adding additional
 */
 
 func varietal(viewRouter: StateKeeper) -> String{
    var stringType = viewRouter.typeValue
    var regionType = viewRouter.regionValue
    let randomInt = Int.random(in: 0...3)
    
    var varietal_IT_Red = [0: "Sangiovese",
                           1: "Barbera",
                           2: "Nebbiolo",
                           3: "Montepulciano"]
    var varietal_FR_Red = [0: "Bordeaux",
                           1: "Burgundy",
                           2: "Beaujolais",
                           3: "Rhone Valley"]
    var varietal_CA_Red = [0: "Cabernet Sauvignon",
                           1: "Merlot",
                           2: "Pinot Noir",
                           3: "Zinfandel"]
    var varietal_SP_Red = [0: "Tempranillo",
                           1: "Garnacha",
                           2: "Mouvedre",
                           3: "Carignan"]
    var varietal_AU_Red = [0: "Syrah",
                           1: "Cabernet Saugvignon",
                           2: "Merlot",
                           3: "Pinot Noir"]
    var varietal_NY_Red = [0: "Cabernet Franc",
                           1: "Merlot",
                           2: "Cabernet Sauvignon",
                           3: "Pinot Noir"]
    var varietal_OR_Red = [0: "Pinot Noir",
                           1: "Syrah",
                           2: "Cabernet Sauvignon",
                           3: "Malbec"]
    

    var varietal_IT_White = [0: "Arneis",
                           1: "Pinot Grigio",
                           2: "Vermentino",
                           3: "Moscato"]
    var varietal_CA_White = [0: "Chardonnay",
                           1: "Sauvignon Blanc",
                           2: "Riesling",
                           3: "Pinot Grigio"]
    var varietal_FR_White = [0: "Chablis",
                           1: "Semillon",
                           2: "Chenin Blanc",
                           3: "Sancerre"]
    var varietal_SP_White = [0: "Albarino",
                           1: "Garnacha Blanca",
                           2: "Godello",
                           3: "Verdejo"]
    var varietal_AU_White = [0: "Chardonnay",
                           1: "Saugvignon Blanc",
                           2: "Riesling",
                           3: "Pinot Gris"]
    var varietal_NY_White = [0: "Riesling",
                           1: "Chardonnay",
                           2: "Traminette",
                           3: "Pinot Gris"]
    var varietal_OR_White = [0: "Pinot Gris",
                           1: "Riseling",
                           2: "Chardonnay",
                           3: "Pinot Blanc"]
    if stringType == "RedWine"{
        switch regionType{
        case "Italy":
            return varietal_IT_Red[randomInt]!
        case "France":
            return varietal_FR_Red[randomInt]!
        case "California":
            return varietal_CA_Red[randomInt]!
        case "Spain":
            return varietal_SP_Red[randomInt]!
        case "Australia":
            return varietal_AU_Red[randomInt]!
        case "New York":
            return varietal_NY_Red[randomInt]!
        case "Oregon":
            return varietal_OR_Red[randomInt]!
        default :
            return " "
        }
    }else{
        switch regionType{
        case "Italy":
            return varietal_IT_White[randomInt]!
        case "France":
            return varietal_FR_White[randomInt]!
        case "California":
            return varietal_CA_White[randomInt]!
        case "Spain":
            return varietal_SP_White[randomInt]!
        case "Australia":
            return varietal_AU_White[randomInt]!
        case "New York":
            return varietal_NY_White[randomInt]!
        case "Oregon":
            return varietal_OR_White[randomInt]!
        default :
            return " "
        }
    }
}

//Function to filter data
func filterWines(wines: [Wine], varietal: String, region: String)-> Int {
    
    var i = 0
    for wine in wines{
        if wine.variety == varietal && wine.country == region{
            return i
        }else {
            i = i+1
        }
        
        
    }
    return -1
}
