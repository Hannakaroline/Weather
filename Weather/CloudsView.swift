//
//  CloudsView.swift
//  Weather
//
//  Created by Hanna on 25/07/24.
//

import SwiftUI

struct CloudsView: View {
    var cloudGroup: CloudGroup
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                cloudGroup.update(date: timeline.date)

                context.opacity = cloudGroup.opacity
                
                for cloud in cloudGroup.clouds {
                    context.translateBy(x: cloud.position.x, y: cloud.position.y)
                    context.scaleBy(x: cloud.scale, y: cloud.scale)
                    
                    let cloudImage = "cloud\(cloud.imageNumber)"
                    context.draw(Image(cloudImage), at: .zero, anchor: .topLeading)
                    
                    context.transform = .identity
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    init(thickness: Cloud.Thickness) {
        cloudGroup = CloudGroup(thickeness: thickness)
    }
}

#Preview {
    CloudsView(thickness: .regular)
}
