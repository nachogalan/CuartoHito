//
//  City.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 19/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class City: NSObject {
    
    let IDCAPITAL = "capital"
    let IDCOUNTRY = "country"
    let IDPOPULATION = "population"
    let IDSTATE = "state"
    let IDNAME = "name"
    
    var sID:String?
    var sCapital:String?
    var sCountry:String?
    var sName:String?
    var iPopulation:Int?
    var sState:String?
    
    func setMap(valores:[String:Any]){
        sCapital = valores [IDCAPITAL] as? String
        sCountry = valores [IDCOUNTRY] as? String
        iPopulation = valores [IDPOPULATION] as? Int
        sState = valores [IDSTATE] as? String
        sName = valores [IDNAME] as? String
    }
    
    func getMap() -> [String:Any]{
        return [
            IDCAPITAL: sCapital as Any,
            IDCOUNTRY: sCountry as Any,
            IDPOPULATION: iPopulation as Any,
            IDSTATE: sState as Any,
            IDNAME: sName as Any
        ]
    }
}
