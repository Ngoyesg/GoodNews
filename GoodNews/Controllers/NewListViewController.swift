//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Natalia Goyes on 3/03/23.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=fa65ea38aaaa4c5c8c882ec0fdec9051")!
        
        WebService().getArticles(url: url) { articles in
            
            self.articleListVM = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articleListVM == nil ? 0 : self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError()
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
}
