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

            // Uma vez que já temos a UI organizada como ela deveria ser, podemos criar structs para cada View
            // separadamente, de forma que elas possam ser reusadas e atualizadas depois com novos dados, que variam.
            // Isso pode ser feito manualmente ou ao clicar na View pressionando command e selecionar Extract View.
            // Uma vez feito isso, podemos chamar a View aqui como uma func, que receberá os dados variáveis

            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))

            VStack {

                CityNameView(cityName: "Fortaleza, CE")

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
                    WeatherButton(weatherButtonTitle: "Mudar Dia da Semana",
                                  textColor: .blue,
                                  buttonBackgroundColor: .white)
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

// Abaixo estão todas as structs como Views reutilizáveis que criamos.
// Dica: se uma View for usada em muitos momentos no app, é melhor separá-la em um arquivo próprio
// Se ela for específica daquele arquivo, podemos deixá-la no arquivo,
// refatorando apenas para melhor legibilidade.
struct DayWheatherView: View {

    // Quando criamos Views como structs que serão chamadas na nossa UI,
    // Suas variáveis e propriedades devem vir antes do seu body:
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

struct BackgroundView: View {

    var topColor: Color
    var bottomColor: Color

    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {

    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default)) // Aqui, design é um parâmetro padrão, então ele poderia ser deletado daqui
            .foregroundColor(.white)
            .padding()
    }
}

struct BigCurrentWeatherView: View {

    var body: some View {
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
}

struct WeatherButton: View {

    var weatherButtonTitle: String
    var textColor: Color
    var buttonBackgroundColor: Color

    var body: some View {
        Text(weatherButtonTitle)
            .frame(width: 280, height: 50)
            .background(buttonBackgroundColor)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
