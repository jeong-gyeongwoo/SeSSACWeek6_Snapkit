//
//  PosterImageView.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/25.
//

import UIKit

class PosterImageView: UIImageView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        print(frame.width, frame)
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        // .zero로 잡아줘서 안 먹힘
        // 이후 컨트롤러의 클로저 구문을 통해 100의 절반을 50을 잡지만 뷰디드로드에서 200을 잡아서 절반으로 값을 못 줌
        // layer.cornerRadius = frame.width / 2
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews",frame.width,frame)
        layer.cornerRadius = frame.width / 2

    }
}
