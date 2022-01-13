//
//  Visa.swift
//  Wejhuh
//
//  Created by Huda N S on 01/06/1443 AH.
//

import UIKit

class Visa: UIViewController {

    // Outlet of button
    @IBOutlet weak var eVisa: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eVisa.layer.shadowColor = UIColor.placeholderText.cgColor
        eVisa.layer.shadowOpacity = 10
        eVisa.layer.shadowOffset = .zero
        eVisa.layer.shadowRadius = 3
    }
    
    // MARK: - button for ApplyForVisa
    @IBAction func ApplyForVisa(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://visa.visitsaudi.com/?_ga=2.9985461.1077917050.1641209048-1425944593.1639381947")! as URL , options: [:], completionHandler: nil)
    }
}
