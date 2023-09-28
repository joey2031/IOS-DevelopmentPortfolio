//
//  Service.swift
//  Bitcoin_App
/*
 https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCMXN
 x-ba-key: NGUyMjI3ZDY0NzNhNDA1NDlkOTFiNjA0YzI4N2U0NjQ
**/

import Foundation
protocol ServiceDelagate : class {
    func bitCoinDidFinish(withData: String)
}


class Service{
    
    static var shared = Service()
    weak var delegate : ServiceDelagate?
    
    
    func fetchBitcoinData(withSearchKey search : String){
        let urlString = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC\(search)"// insert api endpoint
        let url = URL(string: urlString) 
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Content-type")
        request.setValue("NGUyMjI3ZDY0NzNhNDA1NDlkOTFiNjA0YzI4N2U0NjQ", forHTTPHeaderField:"x-ba-key")
        //let session = URLSession.shared
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // NOTE: You must resume the data taks
        session.dataTask(with: request){(data, response, error) in
            DispatchQueue.main.async {
                if let data = data{
                   // JSON is a bunch of NSDictionarys
                    let dictionaryObj = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                    
                    DispatchQueue.main.async {
                        // This has to be the value type the api returns -> double
                        guard let askValue = dictionaryObj!["ask"] as? Double else {return}
                        print(askValue.description)
                        self.delegate?.bitCoinDidFinish(withData:(askValue.description))
                                                
                    }
                    print("bitCoinDidFinish has been called") 
                }
            }
        }.resume()
    }
}



