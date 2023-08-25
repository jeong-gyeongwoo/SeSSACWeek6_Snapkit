//
//  NetflixMovieImageView.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/25.
//

import UIKit


class NetflixMovieImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configuration() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 3
        backgroundColor = .white
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2

    }
    
}
