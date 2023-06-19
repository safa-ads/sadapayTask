//
//  GitHubRepositoriesTableViewCell.swift
//  SadaPayTask
//
//  Created by Safa Ads on 18/06/2023.
//

import Foundation
import UIKit
import Kingfisher
import SkeletonView

class GitHubRepositoriesTableViewCell: UITableViewCell {
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var personalNameLabel: UILabel!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var languageParentView: UIView!
    @IBOutlet private weak var languageView: UIView!
    @IBOutlet private weak var starCount: UILabel!
    @IBOutlet private weak var starImageView: UIImageView!
    @IBOutlet private weak var stargazerCountsView: UIView!
    @IBOutlet private weak var parentBottonView: UIView!
    
    var skeletonableViews: [UIView] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        configureRoundedCorners()
        skeletonableViews = [profileImageView, personalNameLabel, repositoryNameLabel]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutSkeletonIfNeeded()
    }
    
    func configureSkeleton() {
        parentBottonView.isHidden = true
        repositoryDescriptionLabel.isHidden = true
        skeletonableViews.forEach({ $0.showSkeleton() })
    }
    
    func configureView(_ model: GitHubRepository.Item) {
        parentBottonView.isHidden = false
        repositoryDescriptionLabel.isHidden = false
        
        skeletonableViews.forEach({ $0.hideSkeleton() })
        
        let url = URL(string: model.owner.avatarUrl)
        profileImageView.kf.indicatorType = .activity
        profileImageView.kf.setImage(with: url)
        
        personalNameLabel.text = model.owner.login
        repositoryNameLabel.text = model.name
        repositoryDescriptionLabel.text = model.description
        
        languageParentView.isHidden = model.language == nil
        languageLabel.text = model.language
        languageView.backgroundColor = model.languageColor?.toHexColor()
        
        stargazerCountsView.isHidden = model.stargazersCount == nil
        
        starCount.text = String(model.stargazersCount ?? -1)
        starImageView.tintColor = .orange
        
    }
    
    private func configureRoundedCorners() {
        profileImageView.roundCorners(radius: profileImageView.frame.height / 2)
        languageView.roundCorners(radius: languageView.frame.height / 2)
        
    }
}
