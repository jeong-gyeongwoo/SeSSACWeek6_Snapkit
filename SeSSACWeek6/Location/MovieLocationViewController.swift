//
//  MovieLocationViewController.swift
//  SeSSACWeek6
//
//  Created by 정경우 on 2023/08/23.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

struct Theater {
    let type: String
    let location: String
    let latitude: Double
    let longitude: Double
}


// 실제 위치 아님
struct TheaterList {
    var mapAnnotations: [Theater] = [
        Theater(type: "롯데시네마", location: "롯데시네마1", latitude: 37.497360, longitude: 127.029701),
        Theater(type: "롯데시네마", location: "롯데시네마2", latitude: 37.497777, longitude: 127.029479),
        Theater(type: "메가박스", location: "메가박스1", latitude: 37.498804, longitude:  127.029313),
        Theater(type: "메가박스", location: "메가박스2", latitude: 37.498888, longitude: 127.027591),
        Theater(type: "CGV", location: "CGV1", latitude: 37.499026, longitude: 127.025952),
        Theater(type: "CGV", location: "CGV2", latitude: 37.498165, longitude: 127.022480)
    ]
}





class MovieLocationViewController: UIViewController {
    var theaterInfo = TheaterList()
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    // var center = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var a = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        checkDeviceLocationAuthorization()
        
      //  setRegionAndAnnotation(center: center)

        
    }
    
    func setRegionAndAnnotation (center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
        if a == false {
            let annotaion = MKPointAnnotation()
            annotaion.title = "테스트"
            annotaion.coordinate =   CLLocationCoordinate2D(latitude: 37.499026, longitude: 127.025952)
            mapView.addAnnotation(annotaion)
        } else {
            let annotaion1 = MKPointAnnotation()
            annotaion1.title = "새싹"
            annotaion1.coordinate = center
            mapView.addAnnotation(annotaion1)
        }
        
    }
    
    
    
    
    
    
    func checkDeviceLocationAuthorization() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치서비스가 꺼져있음")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            a.toggle()
            showLocationSettingAlert()
            let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
            setRegionAndAnnotation(center: center)
        case .authorizedAlways:
            print("authorizedAlways")
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            print("unknown default")
        }
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)

        alert.addAction(cancel)
        alert.addAction(goSetting)

        present(alert, animated: true)
        
    }
    
    
    
}
extension MovieLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
        locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
    
    
}



//setRegionAndAnnotation 문제점
//1. 모든 annotation을 일일히 써야하는지
//2. "새싹" annotation 때문에 함수를 하나 더 만들어야 하는지 or
// 지금 처럼.. 다른방법?
