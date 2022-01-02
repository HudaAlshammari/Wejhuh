//
//  VideoTableViewCell.swift
//  Wejhuh
//
//  Created by Huda N S on 29/05/1443 AH.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var item : Item?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell (_ v:Item) {
        self.item = v
        
        guard self.item != nil else {
            return
        }
        
        self.titleLabel.text = item!.snippet.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: item!.snippet.publishedAt)
        
        
        
        guard self.item!.snippet.thumbnails.standard.url != "" else {
            return
        }
        
        
        let url = URL(string: self.item!.snippet.thumbnails.standard.url)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                
                //immage
                if url!.absoluteString != self.item?.snippet.thumbnails.standard.url{
                    return
                }
                
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
    }

}
