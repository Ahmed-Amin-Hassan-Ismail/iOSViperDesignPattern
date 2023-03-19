//
//  UserTableViewCell.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var userImageView: UIImageView! {
        didSet {
            setupImageView()
        }
    }
    @IBOutlet weak var userTitleLabel: UILabel!
    @IBOutlet weak var userSubTitleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    private func setupImageView() {
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
}
