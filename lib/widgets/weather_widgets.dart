import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Widget tempeatureAreaWidget(String iconCode, String des,String temp) {
  int temperature = double.parse(temp).round();
  temp = '$temperature°C';
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset(
        "assets/weather/$iconCode.png",
        height: 80,
        width: 80,
      ),
      Container(
        height: 50,
        width: 1,
        color: Colors.grey,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(
              text: temp,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: Colors.black,
              )),
          TextSpan(
              text: des,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              )),
        ]),
      )
    ],
  );
}

Widget circularIndicatorWidget(String hum) {
  double value = hum != null ? double.tryParse(hum) ?? 0.0 : 0.0;
  return Column(
    children: [
      SizedBox(
        height: 140, // Adjust the height as needed
        child: Column(
          children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: value,
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        bottomLabelText: "Humidity",
                        bottomLabelStyle: const TextStyle(
                            letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                        const Color(0xff408ADE).withAlpha(100),
                        progressBarColors: [
                          const Color(0xff408ADE),
                          const Color(0xff5286CD)
                        ])),
              ),
            ),
          ],
        ),
      )
    ],
  );
}


Widget circularIndicatorMoisture(String moist){
  double value = moist != null ? double.tryParse(moist) ?? 0.0 : 0.0;
  return Column(
    children: [
      SizedBox(
        height: 180,
        child: Column(
          children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: value,
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        bottomLabelText: "Moisture",
                        bottomLabelStyle: const TextStyle(
                            letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                        const Color(0xff408ADE).withAlpha(100),
                        progressBarColors: [
                          const Color(0xff408ADE),
                          const Color(0xff5286CD)
                        ])),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

