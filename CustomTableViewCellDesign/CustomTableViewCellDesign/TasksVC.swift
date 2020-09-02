//
//  TasksVC.swift
//  CustomTableViewCellDesign
//
//  Created by AlHassan Al-Mehthel on 14/01/1442 AH.
//  Copyright © 1442 AlHassan Al-Mehthel. All rights reserved.
//

import UIKit

class TasksVC: UIViewController {

    let cellid = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // #1 - implementing header view
    let headerView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .init(white: 0.95, alpha: 1)
        $0.layer.cornerRadius = 60
        return $0
    }(UIView())
    
    // #2.0 - implementing tasksTableView
    lazy var tasksTableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self // 2.1
        $0.delegate = self // 2.2
        $0.register(TaskCell.self, forCellReuseIdentifier: cellid) // 2.3
        $0.backgroundColor = .clear
        return $0
    }(UITableView())
    
    let addNewTaskButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemPink
        $0.setBackgroundImage(UIImage(named: "add"), for: .normal)
        $0.tintColor = .init(white: 0.95, alpha: 1)
        $0.layer.cornerRadius = 30
        $0.addTarget(self, action: #selector(AddNewTaskAction), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))

    @objc func AddNewTaskAction() {
        print("add new task")
        
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.addNewTaskButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (true) in
            self.addNewTaskButton.transform = .identity
        }
 
    }
    
}


extension TasksVC {
    func setupUI() {
        view.backgroundColor = .black
        
        // disappear navigationBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // #2 : add subViews to the super view
        view.addSubview(headerView)
        view.addSubview(tasksTableView)
        view.addSubview(addNewTaskButton)
        
        // #3 : setup autoLayout
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 300),
            
            tasksTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            tasksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tasksTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tasksTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            addNewTaskButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            addNewTaskButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            addNewTaskButton.heightAnchor.constraint(equalToConstant: 60),
            addNewTaskButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}


// MARK: TableView Datasource 2.1
extension TasksVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! TaskCell
        cell.taskTitle.text = "Task #\(indexPath.row + 1)"
        return cell
    }
 
}


// MARK: TableView Delegate 2.2
extension TasksVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
