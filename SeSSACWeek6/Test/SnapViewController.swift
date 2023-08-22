//
//  SnapViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/22.
//

import UIKit
import SnapKit

//addSubView 위치
//superView가 누군지
//offset inset
//RTL - leading, trailing 바뀜
//left, right는 대응(현지화)이 안됨

class SnapViewController: UIViewController {
    
    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        //view.addSubview(yellowView)
        // addSubview 순서가 상관이 있음
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
            
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            //make.leading.equalTo(view.safeAreaLayoutGuide)
            //make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            make.center.equalTo(view)
            // make.centerX.centerY.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(200)
            //make.height.width.equalTo(200)
            //make.width.equalTo(200)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            //make.size.equalTo(150)
            //현재 Superview는 blueView
            //make.leading.top.equalToSuperview()
            // make.leading.trailing.top.bottom.equalToSuperview()
            // make.edges.equalToSuperview()
            
            //한방향으로 밀어내기
            // make.edges.equalTo(blueView).offset(50)
            
            // 안쪽으로
            make.edges.equalTo(blueView).inset(50)
        }
        
        
        
        
        
        
    }
    
    //
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        print(view.frame.size)
    //        print(redView.frame)
    //        print(redView.frame.size)
    //        print(redView.frame.origin)
    //
    //    }
    
    
    
    
    
}




