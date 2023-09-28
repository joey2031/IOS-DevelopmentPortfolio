//
//  Currencys.swift
//  Bitcoin_App
//
//

import Foundation

class Name{
    let name: String
    init(name: String){
        self.name = name;
    }
}


class Currencys{
    lazy var currNames : [Name] = {
        return [Name(name: "RON"),
                Name(name: "MKD"),
                Name(name: "MXN"),
                Name(name: "CAD"),
                Name(name: "ZAR"),
                Name(name: "AUD"),
                Name(name: "NOK"),
                ]
    }()
}


