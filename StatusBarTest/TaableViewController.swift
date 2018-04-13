//
//  TaableViewController.swift
//  StatusBarTest
//
//  Created by Hammoud Hammoud on 4/10/18.
//  Copyright © 2018 Hammoud Hammoud. All rights reserved.
//

import UIKit

class TaableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let names = ["Hammoud", "Jeff", "Dennis"]
    let posts = ["Hey this is awesome", "I sure love this place", "HEY!"]
    var tableViewData = [("TJ", "What's good here?")]
    var counter = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        // Do any additional setup after loading the view.
    }

    @IBAction func addPost(_ sender: UIButton) {
        tableViewData.append((names[Int(arc4random_uniform(3))], posts[Int(arc4random_uniform(3))]))
        var tableViewAnimation = UITableViewRowAnimation.fade
        if counter > 5 {
            counter = 0
        }
        switch counter {
        case 0:
            tableViewAnimation = .fade
        case 1:
            tableViewAnimation = .right
        case 2:
            tableViewAnimation = .left
        case 3:
            tableViewAnimation = .top
        case 4:
            tableViewAnimation = .bottom
        case 5:
            tableViewAnimation = .middle
        default:
            break
        }
        tableView.insertRows(at: [IndexPath(row: tableViewData.count - 1, section: 0)], with: UITableViewRowAnimation.fade)
        
        counter += 1
    }

    @IBAction func clearTable(_ sender: UIButton) {
        tableViewData.removeAll()
        tableView.reloadData()
    }
}

extension TaableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostCell else{
             return UITableViewCell()
        }

        cell.configureCell(name: names[Int(arc4random_uniform(3))], post: posts[Int(arc4random_uniform(3))])
        return cell
    }
}
