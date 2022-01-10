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
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
        usefulContact.append(UsefulContact(title: "n", number: "900"))
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


struct UsefulContact {
    let title : String
    let number : String
}
