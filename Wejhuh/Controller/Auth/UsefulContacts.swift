//
//  UsefulContacts.swift
//  Wejhuh
//
//  Created by Huda N S on 07/06/1443 AH.
//

import UIKit
import SwiftUI

class UsefulContacts: UITableViewController {

    @IBOutlet var UsefulContacts: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUsefulContacts()
    }
    
    var usefulContact = [UsefulContact]()
    
    func setUsefulContacts(){
        usefulContact.append(UsefulContact(title: "Police", number: "999"))
        usefulContact.append(UsefulContact(title: "Saudi Aumbulance", number: "997"))
        usefulContact.append(UsefulContact(title: "Civil Defence", number: "998"))
        usefulContact.append(UsefulContact(title: "For Traffic accidents", number: "993"))
        usefulContact.append(UsefulContact(title: "Emergancy medical consulatation", number: "933"))
        usefulContact.append(UsefulContact(title: "Elecrtricity company emergency", number: "938"))
        usefulContact.append(UsefulContact(title: "passports", number: "992"))
        usefulContact.append(UsefulContact(title: "Saudi publice Securty", number: "989"))
        usefulContact.append(UsefulContact(title: "General enquires", number: "905"))
        usefulContact.append(UsefulContact(title: "Municipalities", number: "940"))
        usefulContact.append(UsefulContact(title: "Consumer protection", number: "935"))
    }

    // MARK: - Table view data source
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


