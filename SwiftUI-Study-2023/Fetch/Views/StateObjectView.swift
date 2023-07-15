//
//  StateObjectView.swift
//  SwiftUI-Study-2023
//
//  Created by Hiroshi.Nakai on 2023/07/15.
//

import SwiftUI

struct StateObjectView: View {
    @StateObject var viewModel = MyModel()
    
    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)")
            Button("Increment") {
                viewModel.count += 1
            }
            StateObjectChildView(viewModel: viewModel)
        }
        
    }
}

struct StateObjectChildView: View {
    @StateObject var viewModel: MyModel
    
    var body: some View {
        Text("Child Count: \(viewModel.count)")
    }
}


struct StateObjectView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}
