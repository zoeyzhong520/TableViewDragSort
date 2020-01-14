//
//  EditCell.swift
//  UITableView拖拽排序
//
//  Created by 仲召俊 on 2020/1/14.
//  Copyright © 2020 zhongzj. All rights reserved.
//

import UIKit

class EditCell: UITableViewCell {

    typealias EditCellBlock = (Bool) -> Void
    
    private let titleLb = UILabel()
    private let switchControl = UISwitch()
    var switchBlock: EditCellBlock?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension EditCell {
    private func setUI() {
        titleLb.text = "Custom Edit"
        titleLb.backgroundColor = .white
        titleLb.frame = CGRect(x: 12, y: 0, width: contentView.bounds.size.width/2, height: contentView.bounds.size.height)
        titleLb.textColor = .black
        titleLb.font = UIFont.systemFont(ofSize: 17)
        contentView.addSubview(titleLb)
        
        switchControl.frame = CGRect(x: contentView.bounds.size.width-12, y: (contentView.bounds.size.height-30)/2, width: 0, height: 0)
        switchControl.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        contentView.addSubview(switchControl)
    }
    
    @objc private func switchAction() {
        switchBlock?(switchControl.isOn)
    }
}
