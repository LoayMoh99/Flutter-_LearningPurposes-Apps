import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_tut/bloc/weather_bloc.dart';
import 'package:weather_bloc_tut/data/model/weather.dart';

import 'weather_detail_page.dart';

class WeatherSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocListener<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.msg),
                ),
              );
            }
          },
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return buildInitialInput();
              } else if (state is WeatherLoading) {
                return buildLoading();
              } else if (state is WeatherLoaded) {
                return buildColumnWithData(context, state.weather);
              } else if (state is WeatherError) {
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildColumnWithData(BuildContext context, Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        RaisedButton(
          child: Text('See Details'),
          color: Colors.lightBlue[100],
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider<WeatherBloc>.value(
                  value: BlocProvider.of<WeatherBloc>(context),
                  child: WeatherDetailPage(
                    masterWeather: weather,
                  ),
                ),
              ),
            );
          },
        ),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    //Fetch the weather from the repository and display it somehow
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    //we can ignore this error (sink error) as it will be fine and no memory leakage hopefuly will ocurrs..
    weatherBloc.add(
      GetWeather(cityName),
    );
  }
}
