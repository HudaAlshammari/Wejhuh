//
//  UsefulContacts.swift
//  Wejhuh
//
//  Created by Huda N S on 07/06/1443 AH.
//

import UIKit
import SwiftUI

class UsefulContacts: UITableViewController {

    var usefulContact = [UsefulContact]()
    
    @IBOutlet var UsefulContacts: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUsefulContacts()
    }
    
    func setUsefulContacts(){
        usefulContact.append(UsefulContact(title: "Police".localaized, number: "999"))
        usefulContact.append(UsefulContact(title: "Saudi Aumbulance".localaized, number: "997"))
        usefulContact.append(UsefulContact(title: "Civil Defence".localaized, number: "998"))
        usefulContact.append(UsefulContact(title: "For Traffic accidents".localaized, number: "993"))
        usefulContact.append(UsefulContact(title: "passports".localaized, number: "992"))
        usefulContact.append(UsefulContact(title: "Saudi publice Securty".localaized, number: "989"))
        usefulContact.append(UsefulContact(title: "General enquires".localaized, number: "905"))
        usefulContact.append(UsefulContact(title: "Municipalities".localaized, number: "940"))
        usefulContact.append(UsefulContact(title: "Consumer protection".localaized, number: "935"))
    }

    // MARK: - Table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usefulContact.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsefulContactsCell
        let data = usefulContact[indexPath.row]
        cell.setupCell(names: data.title, numbers: data.number)
        return cell
    }
}


