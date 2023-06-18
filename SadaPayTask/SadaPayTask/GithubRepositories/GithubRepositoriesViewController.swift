//
//  GithubRepositoriesViewController.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import UIKit
import RxSwift


class GithubRepositoriesViewController: UIViewController {
    //MARK: - IBoutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Stored properties
    var viewModel: GithubRepositoriesViewModelProtocol?
    private var state: GithubRepositoriesScene.State?
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
}

//MARK: - Helpers
private extension GithubRepositoriesViewController {
     func configureViewModel() {
        viewModel?.states.observe(on: MainScheduler.instance).subscribe({ [weak self] state in
            self?.state = state.element
        }).disposed(by: disposeBag)
        
    }

    func setupNavigationControllerTitle() {
        self.title = "Trending"
    }
}
