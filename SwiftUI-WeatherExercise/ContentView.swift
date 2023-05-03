//
//  ContentView.swift
//  SwiftUI-WeatherExercise
//
//  Created by Pedro Muniz on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {

            LinearGradient(colors: [.blue, Color("lightBlue")],
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)

            VStack {

                Text("Fortaleza, CE")
                    .font(.system(size: 32, weight: .medium, design: .default)) // design here is a default paremeter, so it could be deleted
                    .foregroundColor(.white)
                    .padding()

                VStack(spacing: 8) {

                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .padding()

                    Text("31° C")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }

                HStack(spacing: 5) {

                    DayWheatherView(dayOfTheWeek: "SEG",
                                    iconName: "cloud.sun.fill",
                                    temperature: 31)

                    DayWheatherView(dayOfTheWeek: "TER",
                                    iconName: "sun.max.fill",
                                    temperature: 33)

                    DayWheatherView(dayOfTheWeek: "QUA",
                                    iconName: "cloud.sun.rain.fill",
                                    temperature: 30)

                    DayWheatherView(dayOfTheWeek: "QUI",
                                    iconName: "cloud.bolt.rain.fill",
                                    temperature: 29)

                    DayWheatherView(dayOfTheWeek: "SEX",
                                    iconName: "cloud.bolt.fill",
                                    temperature: 28)


                }
                .frame(width: 385, height: 100)

                Spacer()

                Button {
                    // Aqui vai a ação do botão, o que ele faz
                } label: { // label especifica a aparência do botão
                    Text("Mudar Dia da Semana")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                }

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DayWheatherView: View {

    var dayOfTheWeek: String
    var iconName: String
    var temperature: Int

    var body: some View {
        VStack {

            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)

            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28,weight: .medium))
        }
        .frame(width: 70, height: 100)
    }
}
