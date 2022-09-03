//
//  DataParser.swift
//  Wine Selector (iOS)
//
//  Created by Matthew Hayashi on 8/31/22.
//

import Foundation

struct Wine: Identifiable{
    var vintage: String = ""
    var country: String = ""
    var county: String = ""
    var designation: String = ""
    var points: String = ""
    var price: String = ""
    var province: String = ""
    var title: String = ""
    var variety: String = ""
    var winery: String = ""
    var id = UUID()

    init(raw:[String]){
        vintage = raw[0]
        country = raw[1]
        county = raw[2]
        designation = raw[3]
        points = raw[4]
        price = raw[5]
        province = raw[6]
        title = raw[7]
        variety = raw[8]
        winery = raw[9]
    }
    
}

func loadCSV(from csvName: String) -> [Wine]{
    var csvToStruct = [Wine]()
    
    //located the csv file
    guard let filePath = Bundle.main.path(forResource:csvName, ofType: "csv")else{
        return []
    }
    
    //convert the contents of the file into one very long string
    var data = ""
    do{
        data = try String(contentsOfFile: filePath)
    } catch{
        print(error)
        return[]
    }
    
    //split the long string into an array of "rows" of data. Each row is a string
    //detect"\n" carriage return, the split
    var rows = data.components(separatedBy: "\n")
    
    //remove header rows
    let columnCount = rows.first?.components(separatedBy:",").count
    rows.removeFirst()
    
    //now loop around each ro and split into columns
    for row in rows{
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount{
        let wineStruct = Wine.init(raw:csvColumns)
        csvToStruct.append(wineStruct)
        }
    }
    
    return csvToStruct
}
