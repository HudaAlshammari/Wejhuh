//
//  ViewController.swift
//  Wejhuh
//
//  Created by Huda N S on 28/05/1443 AH.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , ModelDelegate{
    
    @IBOutlet weak var tableViewVideos: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewVideos.dataSource = self
        tableViewVideos.delegate = self
        model.delegate = self
        
        
        model.gitVideos()
    }
    //ModelDelegate
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
    
        
        
        tableViewVideos.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constents.videoCellId , for: indexPath)
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
