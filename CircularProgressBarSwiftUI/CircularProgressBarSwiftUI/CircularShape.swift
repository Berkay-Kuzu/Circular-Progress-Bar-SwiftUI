//
//  CircularShape.swift
//  CircularProgressBarSwiftUI
//
//  Created by Berkay Kuzu on 25.09.2022.
//

import Foundation
import SwiftUI

struct CircularShape: Shape {
    
    var percent : Double // yüzde kaçı dolu olacak? (Yeni özellik)
    var startAngle : Double
    
    typealias AnimatableData = Double
    var animatableData: Double { // animatableData'nın değeri aslında percent!
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    init(percent: Double = 100, startAngle: Double = -90) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    func path(in rect: CGRect) -> Path { /* Patika bizim çizeceğimiz şeklin "yolunu" belirtir*/
        
        let width = rect.width
        let height = rect.height
        let radius = min(width,height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = (self.percent / 100 * 360) + startAngle
        
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
            
        }
    }
    
}


