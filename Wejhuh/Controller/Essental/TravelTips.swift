//
//  TravelTips.swift
//  Wejhuh
//
//  Created by Huda N S on 01/06/1443 AH.
//

import UIKit

class TravelTips: UIViewController {

    // Outlet of items
    
    @IBOutlet weak var viewIcon: UIView!
    @IBOutlet weak var mawidIcon: UIImageView!
    @IBOutlet weak var mawid: UIButton!

    @IBOutlet weak var ministryOfHealthView: UIView!
    @IBOutlet weak var ministryOfHealth: UIButton!
    @IBOutlet weak var ministryOfHealthIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // buttons style
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
    
    
    // MARK: - buttons
    
    //button for ApplyForVisa
    @IBAction func mawidButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.moh.gov.sa/eServices/Pages/cassystem.aspx")! as URL , options: [:], completionHandler: nil)
    }
    
    //button for ministry Of Health
    @IBAction func ministryOfHealthButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.moh.gov.sa/Pages/default.aspx")! as URL , options: [:], completionHandler: nil)
    }
}
