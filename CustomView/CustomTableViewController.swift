//
//  CustomTableViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {
    
    //viewDidLoad보다 클로저 구문이 먼저 실행
    //CustomTableViewController 인스턴스 생성 직전에 클로저 구문이 먼저 실행
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1.
        view.delegate = self  // 자기자신의 인스턴스
        view.dataSource = self
        //uinib - xib
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return view
    }()
    
    let imageView = {
        //이미지 뷰는 서브뷰를 가지고 있기 때문에 frame 써줘야함
        // rect -> 0,0,0,0 == .zero
       // let view = PosterImageView(frame: .zero)
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    } ()
    
    
    // var isExpand = false //false 2줄, true 0줄
    var list = [Sample(text: "테스트셀,테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀테스트셀", isExpand: false), Sample(text: "asdasd", isExpand: false), Sample(text: "ww", isExpand: false) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // addSubview이후 레이아웃을 작성해야함
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            print("constraints 순서")
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
        
        //위치 이동
//        tableView.delegate = self  // 자기자신의 인스턴스
//        tableView.dataSource = self
//        //uinib - xib
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
//
    }
    
    
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.label.text = list[indexPath.row].text
        cell.label.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        
        // cell.textLabel?.text = list[indexPath.row].text
        //  cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //isExpand.toggle()
        list[indexPath.row].isExpand.toggle()
        // tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .fade)
        //위에서 특정셀 지정 가능 IndexPath(row: <#T##Int#>, section: <#T##Int#>)
    }
    
    
}

//셀 크기 조절
//1. automaticDimension
//2. numberOfLines
//3. 셀의 레이아웃
