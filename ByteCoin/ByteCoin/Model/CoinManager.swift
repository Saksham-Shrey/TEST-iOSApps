//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import Alamofire

protocol CoinManagerDelegate {
    func dataReceived(coinData: CoinData)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ProcessInfo.processInfo.environment["API_KEY"]!
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
  
    // This function will be called by the ViewController class with proper arguments which will contain the 'API_REQUEST_STRING'
    func fetchCoinData(with url: String){
        
        AF.request(url).responseDecodable(of: CoinData.self) { response in
            // A request is made to the url and a response is expected which shall be decoded in the format of CoinData
            
            // The returned Response is stored locally as "response" and is then used to check for success or failure of the request using the .result
            
            switch response.result {
                
                
                // If the request is successful, then the returned data from the response is stored locally as CoinData which can be used further as per the requirements
            case .success(let CoinData):
                self.delegate?.dataReceived(coinData: CoinData)
                // Here, the CoinData is passed to another function named dataReceived in the delegated class (here, it's the ViewController)
                
                // If the request is not successful, then the returned Error is stored with the local name CoinDataFetchError which can be handled appropriately
            case .failure(let CoinDataFetchError):
                print(CoinDataFetchError.localizedDescription)
            }
        }
    }
}
