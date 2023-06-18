//
//  GithubRepositoriesErrorView.swift
//  SadaPayTask
//
//  Created by Safa Ads on 18/06/2023.
//

import UIKit
import Lottie

protocol GithubRepositoriesErrorViewDelegate: AnyObject {
    func didTapRetry()
}
class GithubRepositoriesErrorView: UIView, NibLoadable {
    //MARK: - IBOutlets
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var lottieView: UIView!
    
    //MARK: - Stored properties
    private var animationView: LottieAnimationView?
    weak var delegate: GithubRepositoriesErrorViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
        configureAnimation()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
        awakeFromNib()
    }
    
    @IBAction func didTapRetry(_ sender: UIButton) {
        delegate?.didTapRetry()
    }
    
}

private extension GithubRepositoriesErrorView {
    func configureButton() {
        let norwayColor = UIColor(named: "Norway")!
        retryButton.addBorders(color: norwayColor.cgColor, radius: 8)
    }
    
    func configureAnimation() {
        animationView = .init(name: "retry")
        animationView!.frame = lottieView.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        lottieView.addSubview(animationView!)
        animationView!.play()
    }
}
