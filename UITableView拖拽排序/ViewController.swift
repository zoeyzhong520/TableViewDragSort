//
//  ViewController.swift
//  UITableView拖拽排序
//
//  Created by 仲召俊 on 2020/1/14.
//  Copyright © 2020 zhongzj. All rights reserved.
//

import UIKit

let reuseIdentifier = "reuseIdentifier"
let editReuseIdentifier = "editReuseIdentifier"

class ViewController: UIViewController {
    
    private var dataSource = [
        "第一个",
        "第二个",
        "第三个",
        "第四个",
        "第五个",
        "第六个",
        "第七个",
        "第八个"
    ]
    
    private lazy var tableView: UITableView = {
        let tb = UITableView(frame: view.bounds, style: .grouped)
        tb.delegate = self
        tb.dataSource = self
        tb.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tb.register(EditCell.self, forCellReuseIdentifier: editReuseIdentifier)
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "拖拽排序"
        setUI()
    }
}

extension ViewController {
    private func setUI() {
        view.addSubview(tableView)
    }
    
    @objc private func editAction() {
        tableView.isEditing = !tableView.isEditing
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: editReuseIdentifier) as? EditCell else { return EditCell(style: .default, reuseIdentifier: editReuseIdentifier) }
            cell.selectionStyle = .none
            cell.switchBlock = { value in
                tableView.setEditing(value, animated: true)
            }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else { return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier) }
        cell.selectionStyle = .none
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        //Asks the delegate whether the background of the specified row should be indented while the table view is in editing mode.
        return false
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //The cell has no editing control.
        return .none
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //Exchanges the values at the specified indices of the collection.
        print("拖动前：\(dataSource)")
        dataSource.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        print("拖动后：\(dataSource)")
    }
    
}

