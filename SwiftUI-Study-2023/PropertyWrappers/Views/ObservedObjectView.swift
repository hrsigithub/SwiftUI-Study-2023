//
//  ObservedObjectView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/15.
//

import SwiftUI

struct ObservedObjectView: View {
    
    @ObservedObject var viewModel = MyModel()
    
    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)")
            Button("Increment") {
                viewModel.count += 1
            }
            ObservedObjectChildView(viewModel:viewModel)
        }
        
    }
}

struct ObservedObjectChildView: View {

    @ObservedObject var viewModel:MyModel

    // 親との連携なし??
    var body: some View {
        Text("Child Count: \(viewModel.count)")
    }
}



struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView()
    }
}
