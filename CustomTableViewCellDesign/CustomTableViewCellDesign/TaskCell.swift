//
//  TaskCell.swift
//  CustomTableViewCellDesign
//
//  Created by AlHassan Al-Mehthel on 14/01/1442 AH.
//  Copyright © 1442 AlHassan Al-Mehthel. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(taskContainerView)
        taskContainerView.addSubview(taskTitle)
        
        
        // setup autolayout
        NSLayoutConstraint.activate([
            taskContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            taskContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            taskContainerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            taskContainerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30),
            
            taskTitle.topAnchor.constraint(equalTo: taskContainerView.topAnchor),
            taskTitle.bottomAnchor.constraint(equalTo: taskContainerView.bottomAnchor),
            taskTitle.leftAnchor.constraint(equalTo: taskContainerView.leftAnchor),
            taskTitle.rightAnchor.constraint(equalTo: taskContainerView.rightAnchor),
        ])
        
    }
    
    let taskContainerView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemPink
        $0.layer.cornerRadius = 10
        return $0
    }(UIView())
    
    
    let taskTitle : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "Futura", size: 22)
        $0.textColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
