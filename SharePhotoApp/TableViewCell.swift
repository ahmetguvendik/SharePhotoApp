//
//  TableViewCell.swift
//  SharePhotoApp
//
//  Created by Ahmet GÜVENDİK on 15.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var PostimageView: UIImageView!
    @IBOutlet weak var noteLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
