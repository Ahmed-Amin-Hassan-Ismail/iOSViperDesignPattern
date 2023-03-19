//
//  UserTableViewCell.swift
//  iOSViperPattern
//
//  Created by Ahmed Amin on 19/03/2023.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell, UsersTableViewCellProtocol {
    
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
    
    func configure(viewModel: UserViewModel) {
        userImageView.kf.setImage(with: URL(string: viewModel.avatar))
        userTitleLabel.text = viewModel.fullName
        userSubTitleLabel.text = viewModel.registrationDate
    }
}
