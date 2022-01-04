//
//  TravelTips.swift
//  Wejhuh
//
//  Created by Huda N S on 01/06/1443 AH.
//

import UIKit

class TravelTips: UIViewController {

    @IBOutlet weak var viewIcon: UIView!
    @IBOutlet weak var mawidIcon: UIImageView!
    @IBOutlet weak var mawid: UIButton!
    
    
    @IBOutlet weak var ministryOfHealthView: UIView!
    @IBOutlet weak var ministryOfHealth: UIButton!
    @IBOutlet weak var ministryOfHealthIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewIcon.layer.shadowColor = UIColor.placeholderText.cgColor
        viewIcon.layer.shadowOpacity = 20
        viewIcon.layer.shadowOffset = .zero
        viewIcon.layer.shadowRadius = 10
        mawidIcon.layer.cornerRadius = 12
        viewIcon.layer.cornerRadius = 12
        
        
        ministryOfHealthView.layer.shadowColor = UIColor.placeholderText.cgColor
        ministryOfHealthView.layer.shadowOpacity = 20
        ministryOfHealthView.layer.shadowOffset = .zero
        ministryOfHealthView.layer.shadowRadius = 10
        ministryOfHealthIcon.layer.cornerRadius = 12
        ministryOfHealthView.layer.cornerRadius = 12
    }
    

    @IBAction func mawidButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://visa.visitsaudi.com/?_ga=2.9985461.1077917050.1641209048-1425944593.1639381947")! as URL , options: [:], completionHandler: nil)
    }
    
    
    
    
    @IBAction func ministryOfHealthButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://visa.visitsaudi.com/?_ga=2.9985461.1077917050.1641209048-1425944593.1639381947")! as URL , options: [:], completionHandler: nil)
    }
}
