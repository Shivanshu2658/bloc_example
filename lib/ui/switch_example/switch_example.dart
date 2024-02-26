import 'package:bloc_counter/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter/bloc/counter/counter_events.dart';
import 'package:bloc_counter/bloc/counter/counter_state.dart';
import 'package:bloc_counter/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_counter/bloc/switch_example/switch_events.dart';
import 'package:bloc_counter/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchStates>(
                    builder: (context, state) {
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotification());
                      });
                })
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            }),

            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(builder: (context, state) {
              return Slider(value: state.slider, onChanged: (value) {
                print("***********");
                context.read<SwitchBloc>().add(SliderEvent(slider: value));
              });
            })
          ],
        ),
      ),
    );
  }
}
