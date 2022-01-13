//
//  Currency.swift
//  Wejhuh
//
//  Created by Huda N S on 01/06/1443 AH.
//

import UIKit

class Currency: UIViewController {

    // Outlet of button
    @IBOutlet weak var CurrencyExchange: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyExchange.layer.shadowColor = UIColor.placeholderText.cgColor
        CurrencyExchange.layer.shadowOpacity = 5
        CurrencyExchange.layer.shadowOffset = .zero
        CurrencyExchange.layer.shadowRadius = 3
    }
    
    // MARK: - button for currencyExchange
    @IBAction func currencyExchangeButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=SAR")! as URL , options: [:], completionHandler: nil)
    }
}
