//
//  MainViewController.swift
//  LT_Demo_APP
//
//  Created by Hiromu Tsuruta on 2019/01/22.
//  Copyright © 2019年 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import SVProgressHUD

// MARK: - Controller

final class MainViewController: UIViewController {
    
    // MARK: Variables
    
    private var currentPage = 1
    private var isLoading = true
    private var dataSource = MainDataSource()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.registerFromNib(type: MainTableViewCell.self)
        table.dataSource = dataSource
        table.delegate = self
        return table
    }()
    
    
    // MARK: Override

    override func loadView() {
        super.loadView()
        
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // NOP
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomOffset = tableView.contentOffset.y + tableView.bounds.size.height
        let lengthFromBotton = tableView.contentSize.height - bottomOffset

        guard lengthFromBotton <= 50, !isLoading else { return }
        isLoading = true
        currentPage += 1
        call()
    }
}


// MARK: - Private

private extension MainViewController {
    
    func setup() {
        SVProgressHUD.show()
        call()
        view = tableView
    }
    
    func call() {
        APICliant.call(
            page: currentPage,
            success: { [weak self] response in
                guard let `self` = self else { return }
                
                SVProgressHUD.dismiss()
                self.dataSource.models = response
                self.tableView.reloadData()
                self.isLoading = false
            },
            failure: { [weak self] error in
                guard let `self` = self else { return }
                
                print("----", error.localizedDescription)
                SVProgressHUD.dismiss()
                self.isLoading = false
            }
        )
    }
}
