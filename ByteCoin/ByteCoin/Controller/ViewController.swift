//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let coinManager = CoinManager()
    
    let session = Session()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadApiData(with: "\(coinManager.baseURL)/\(coinManager.currencyArray[row])?apikey=\(coinManager.apiKey)")
    }
    
    func dataReceived(coinData: CoinData) {
        DispatchQueue.main.async { [self] in
            bitcoinLabel.text = String(format: "%.4f", coinData.rate)
            currencyLabel.text = coinData.asset_id_quote
        }
    }

    func loadApiData(with url: String){

            AF.request(url).responseDecodable(of: CoinData.self) { [self] response in

                switch response.result {
                    
                case .success(let CoinData):
                    dataReceived(coinData: CoinData)

                case .failure(let CoinDataFetchError):
                    print(CoinDataFetchError.localizedDescription)
                }
            }
        }


}


