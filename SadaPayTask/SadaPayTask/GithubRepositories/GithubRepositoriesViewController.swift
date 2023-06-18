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
    var errorView: GithubRepositoriesErrorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        setupNavigationControllerTitle()
        configureTableView()
        viewModel?.getRepositories()
    }
}

//MARK: - Helpers
private extension GithubRepositoriesViewController {
    func configureViewModel() {
        viewModel?.states.observe(on: MainScheduler.instance).subscribe({ [weak self] state in
            self?.state = state.element
            
            switch state.element! {
            case .loading, .loaded:
                self?.errorView?.removeFromSuperview()
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            case .error:
                self?.configureErrorView()
                self?.tableView.isHidden = true
            }
        }).disposed(by: disposeBag)
        
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "GitHubRepositoriesTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: GitHubRepositoriesTableViewCell.self))
        
        tableView.dataSource = self
    }
    
    func setupNavigationControllerTitle() {
        self.title = "Trending"
    }
    
    func configureErrorView() {
        errorView = GithubRepositoriesErrorView()
        view?.bringSubviewToFront(errorView!)
        errorView?.delegate = self
        view.addSubview(errorView!)
        errorView!.pinToEdges(view)
    }
}

extension GithubRepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let state else { return UITableViewCell() }
        let cell: GitHubRepositoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GitHubRepositoriesTableViewCell") as! GitHubRepositoriesTableViewCell
        switch state {
        case .loaded(let data):
            cell.configureView(data.items[indexPath.row])
            return cell
        case .loading:
            cell.configureSkeleton()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .loaded(let data):
            return data.items.count
        case .loading:
            return  GithubRepositoriesScene.Constants.shimmeringCount
        default:
            return 0
        }
    }
}

//MARK: - GithubRepositoriesErrorViewDelegate
extension GithubRepositoriesViewController: GithubRepositoriesErrorViewDelegate {
    func didTapRetry() {
        viewModel?.getRepositories()
    }
}
