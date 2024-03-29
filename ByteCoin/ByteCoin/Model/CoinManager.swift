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
    
    func fetchCoinData(with url: String){

            AF.request(url).responseDecodable(of: CoinData.self) { [self] response in

                switch response.result {
                    
                case .success(let CoinData):
                    self.delegate?.dataReceived(coinData: CoinData)

                case .failure(let CoinDataFetchError):
                    print(CoinDataFetchError.localizedDescription)
                }
            }
        }
}
