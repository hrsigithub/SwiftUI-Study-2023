//
//  SwiftUIView2.swift
//  SwiftUIStudy
//
//  Created by Hiroshi.Nakai on 2022/05/10.
//

// https://www.hackingwithswift.com/books/ios-swiftui

import SwiftUI

struct WeSplit: View {

    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    // ---

    @State private var checkAmount: Int = 0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20

    let tipPercentages = [10, 15, 20, 25, 0]
    // ---
    @State private var name = ""

    @FocusState private var amountIsFocused: Bool
    // ---
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = Double(checkAmount) / 100.0 * tipSelection
        let grandTotal = Double(checkAmount) + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }


    var body: some View {
        NavigationView {
            Form {
//                Section {
//                    TextField("Enter your name", text: $name)
//                    Text("Your name is \(name)")
//                }

                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                        .foregroundColor(.blue)
                }


                Section {

                    // 金額テキスト
                    // フォーカスがはずれると、カンマ、¥ 記号つく
                    TextField("Amount", value: $checkAmount,
                              format: .currency(code: "JPY"))
                    .keyboardType(.numberPad)
                    .focused($amountIsFocused)

                    // ¥つかない。カンマつく
                    Text("format not \(checkAmount)")
                    Text("\(checkAmount.formatted().description)")

                    Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2 ..< 100) {
                                // デフォルトは 2 ではなくて、4
                                Text("\($0) people")
                            }
                        }

                }


                Section {
//                    TextField("Amount", value: $checkAmount,
//                              format: .currency(code: Locale.current.currencyCode ?? "JPY"))

                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "JPY"))

                }

                Section {
//                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "JPY"))

                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "JPY"))

                }

//                Section {
//                    Picker("Select your student", selection: $selectedStudent) {
//                        ForEach(students, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                    Text(selectedStudent)
//                }
            }
            .navigationTitle("WeSplit")
            //            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer() // 右寄せ
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct WeSplit_Previews: PreviewProvider {
    static var previews: some View {
        WeSplit()
    }
}
