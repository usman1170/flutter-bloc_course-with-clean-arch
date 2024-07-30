import 'dart:developer';

import 'package:bloc_course/slider_exp/bloc/slider_bloc.dart';
import 'package:bloc_course/slider_exp/bloc/slider_event.dart';
import 'package:bloc_course/slider_exp/bloc/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({super.key});

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  @override
  Widget build(BuildContext context) {
    log("Slider rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Bloc"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  log("notification build");
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Notification",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Icon(state.isSwitch ? Icons.done : Icons.clear)
                        ],
                      ),
                      Switch(
                          value: state.isSwitch,
                          onChanged: (value) {
                            log(state.isSwitch.toString());
                            context
                                .read<SwitchBloc>()
                                .add(EnabledNotificationEvent());
                          })
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  log("slider build");
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(state.slider),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Slider(
                        value: state.slider,
                        onChanged: (value) {
                          log(value.toString());
                          context
                              .read<SwitchBloc>()
                              .add(SliderEvent(slider: value));
                        },
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
