//
//  MovieCell.swift
//  flix
//
//  Created by Kweku Aboagye on 9/22/20.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var synopsisLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
