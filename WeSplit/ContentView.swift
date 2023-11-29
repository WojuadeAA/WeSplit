//
//  ContentView.swift
//  WeSplit
//
//  Created by Wojuade Abdul Afeez on 19/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    
    let students: [String] = ["Harry", "Hermione", "Ron"]
    var greeting: String?
    var grandTotal : Double{
        let tipPercentage = Double(tipPercentage)
        let tipToPay = (tipPercentage / 100) * checkAmount
        let grandTotal = tipToPay + checkAmount
        return grandTotal
    }
    var totalPerPerson : Double {
        let numberOfPeopleInDouble = Double( numberOfPeople + 2)
        
        return grandTotal / numberOfPeopleInDouble
    }
    @State private var selectedStudent = ""
    var body: some View {
       
        NavigationStack {
            Form {
                Section {
                    TextField("Amount",value:$checkAmount,format:.currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                    
                }
                Section("How much do you want to tip"){
                    
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101, id: \.self){
                            Text("\($0) %")
                        }
                    }.pickerStyle(.navigationLink)
                }
                Section("Amount per person"){
                    Text(totalPerPerson ,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            Section("Total Amount to be paid"){
                Text(grandTotal ,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            
        
                
                
            }.navigationTitle("We Split")
             .toolbar{
                 if amountIsFocused {
                     Button("Done") {
                         amountIsFocused = false
                     }
                 }
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
