//
//  CustomTableViewCell.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/25.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    let label = UILabel()
    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //슈퍼 작성하기
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //메서드의 순서 중요 addsubview이후 Constriants설정
        configure()
        setConstriants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
       // view.addSubview(label) view 아님!!
       // addsubview(label) 이것도 오류가 안나고 레이아웃 잘 적용 안됨, 아님!!
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }
    
    func setConstriants() {
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
        
    }
    //Interface Bulider(스토리보드상에서 실행)
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
