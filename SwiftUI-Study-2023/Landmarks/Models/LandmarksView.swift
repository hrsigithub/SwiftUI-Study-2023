//
//  ContentView.swift
//  Landmarks
//
//  Created by Hiroshi.Nakai on 2023/01/14.
//

import SwiftUI

struct LandmarksView: View {
    var body: some View {
        LandmarkList()
        //        VStack {
        //            MapView()
        //                .ignoresSafeArea(edges: .top)
        //                .frame(height: 300)
        //
        //            CircleImage()
        //                .offset(y: -130)
        //                .padding(.bottom, -130)
        //
        //            VStack(alignment: .leading) {
        //                Text("Turtle Rock")
        //                    .font(.title)
        //                HStack {
        //                    Text("ジョシュア ツリー国立公園")
        //                    Spacer()
        //                    Text("California")
        //                }
        //                .font(.subheadline)
        //                .foregroundColor(.secondary)
        //
        //                Divider()
        //
        //                Text("About Turtle Rock")
        //                    .font(.title2)
        //                Text("Descriptive text goes here.")
        //
        //            }
        //            .padding()
        //            Spacer()
        //        }
        
    }
}

struct LandmarksView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksView()
    }
}
