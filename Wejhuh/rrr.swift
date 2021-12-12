//
//  Essentals.swift
//  Wejhuh
//
//  Created by Huda N S on 04/05/1443 AH.
//

import UIKit

class Essentals: UIViewController {
    @IBOutlet weak var EssentalsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension Essentals : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Essentals
        else {fatalError("dfghj")}
        return cell
    }
}
