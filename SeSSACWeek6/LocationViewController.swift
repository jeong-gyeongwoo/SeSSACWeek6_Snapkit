//
//  LocationViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/22.
//

import UIKit
import CoreLocation //1.위치 임포트
import MapKit
import SnapKit

class LocationViewController: UIViewController {
    
    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    let cafeButton = UIButton()
    let foodButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setAnnotaion(type: 0)
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
        
        view.addSubview(cafeButton)
        cafeButton.backgroundColor = .red
        cafeButton.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        cafeButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(120)
            make.size.equalTo(50)
            make.leading.equalTo(view).offset(100)
        }
        
        view.addSubview(foodButton)
        foodButton.backgroundColor = .blue
        foodButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(120)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-100)
        }
        //3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        //info.plist << 얼럿
        //locationManager.requestWhenInUseAuthorization()
        
        //프로토콜에서 호출해주지만 nav나 present하면 안 뜰수도 있음, 여기서 꼭 호출해주기
        checkDeviceLocationAuthorization()
        
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        setRegionAndAnnotation(center: center)
        
        
    }
    
    @objc func cafeButtonClicked() {
        setAnnotaion(type: 1)
        print("====")
    }
    
    
    
    func setAnnotaion(type: Int) {
        
        let annotaion1 = MKPointAnnotation()
        annotaion1.coordinate = CLLocationCoordinate2D(latitude: 37.517857, longitude: 126.886714 )
       // mapView.removeAnnotation(annotaion1)
        
        let annotaion2 = MKPointAnnotation()
        annotaion2.coordinate = CLLocationCoordinate2D(latitude: 37.517746, longitude: 126.887131 )
       // mapView.addAnnotations([annotaion2])
        
        if type == 0 { //viewDidLoad
            mapView.addAnnotations([annotaion1, annotaion2])
        } else if type == 1 {
        //type == 0의[annotaion1,]과 다름, scope
          //mapView.removeAnnotation(annotaion1)
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotaion2])
        }
        
    }
    
    //지도에 핀꼽는게 Annotation
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        //지도 중심 기반으로 보여질 범위 설정
        //let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(region, animated: true)
        
        //지도에 Annotation 추가
        let annotaion = MKPointAnnotation()
        annotaion.title = "새싹"
        annotaion.coordinate = center
        mapView.addAnnotation(annotaion)
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            
            //설정에서 직접적으로 앱 설정 화면에 들어간적이 없다면
            // 한번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서
            // 설정 페이지로 넘어갈지, 설정 상세 페이지 결정 못함
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func checkDeviceLocationAuthorization() {
        DispatchQueue.global().async {
            //iOS 위치 서비스 활성화
            if CLLocationManager.locationServicesEnabled() {
                
                //현재 사용자 위치 권한 상태를 가지고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                    
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                print(authorization)
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 꺼져있어 위치 권한 요청을 못합니다")
            }
        }
        
    }
    
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("check", status)
        
        switch status {
        case .notDetermined:
            //업뎃 정확도
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            //요청얼럿, infoplist에서 wheninuse 설정을 미리 해야함
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            // didUpdateLocations 메서드 실행
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default: //위치 권한 종류가 더 생길 가능성 대비
            print("default")
        }
    }
    
    
    
    
}
//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    //5. 사용자의 위치를 가져온 케이스, 새로운 위치를 알려줌 -> 기준?
    //한번만 실행되지 않는다, iOS 위치 업데이트가 필요한 시접에 알아서 여러번 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print("====",locations)
        //위도 경도 값 꺼내기
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
            //위치기반 날씨API 호출 가능
        }
        
        locationManager.stopUpdatingLocation()
    }
    // 사용자의 위치를 가져오지 못한 케이스
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //프로토콜 디폴트 메서드, 사용자가 클릭을 하면 애플이 자동으로 호출해줌.
    //사용자의 권한 상태가 바뀔 때를 알려줌
    //거부했다가 설정에서 변경을 했거나, 혹은 notDertermined상태에서 허용을 했거나
    //허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    // iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        //viewdidload 개념, 권한바뀌면 전 메서드를 다시 호출하면서  다른 케이스를 실행
        checkDeviceLocationAuthorization()
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌
    // iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}

extension LocationViewController: MKMapViewDelegate {
    //지도를 움직이다가 멈추면 호출되는 메서드
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    //지도의 요소(공간, 어노테이션 등)을 클릭을 할 때
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
    //    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
    //        print(#function)
    //    }
    //
    
    
}
