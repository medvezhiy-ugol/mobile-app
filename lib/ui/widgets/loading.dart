import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/widgets/shim.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111216),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Center(child: Shim(height: 34, width: 232, radius: 38)),
              const SizedBox(height: 9),
              const Center(child: Shim(height: 17, width: 145, radius: 38)),
              const SizedBox(height: 24),
              const SizedBox(
                height: 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Shim(radius: 0)),
                    SizedBox(width: 11),
                    Expanded(child: Shim(radius: 0)),
                    SizedBox(width: 11),
                    Expanded(child: Shim(radius: 0)),
                    SizedBox(width: 11),
                    Expanded(child: Shim(radius: 0)),
                    SizedBox(width: 11),
                    Expanded(child: Shim(radius: 0)),
                  ],
                ),
              ),
              const SizedBox(height: 29),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color(0xff181A1F),
                      margin: const EdgeInsets.only(left: 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shim(height: 127, radius: 0),
                          SizedBox(height: 13),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 17, width: 145, radius: 26),
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 10, width: 45, radius: 22),
                          ),
                          SizedBox(height: 100),
                          Padding(
                            padding: EdgeInsets.only(left: 8, bottom: 12),
                            child: Shim(height: 18, width: 45, radius: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: Container(
                      color: const Color(0xff181A1F),
                      margin: const EdgeInsets.only(left: 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shim(height: 127, radius: 0),
                          SizedBox(height: 13),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 17, width: 145, radius: 26),
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 10, width: 45, radius: 22),
                          ),
                          SizedBox(height: 100),
                          Padding(
                            padding: EdgeInsets.only(left: 8, bottom: 12),
                            child: Shim(height: 18, width: 45, radius: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Shim(height: 24, width: 145, radius: 38),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color(0xff181A1F),
                      margin: const EdgeInsets.only(left: 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shim(height: 127, radius: 0),
                          SizedBox(height: 13),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 17, width: 145, radius: 26),
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 10, width: 45, radius: 22),
                          ),
                          SizedBox(height: 100),
                          Padding(
                            padding: EdgeInsets.only(left: 8, bottom: 12),
                            child: Shim(height: 18, width: 45, radius: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: Container(
                      color: const Color(0xff181A1F),
                      margin: const EdgeInsets.only(left: 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shim(height: 127, radius: 0),
                          SizedBox(height: 13),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 17, width: 145, radius: 26),
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Shim(height: 10, width: 45, radius: 22),
                          ),
                          SizedBox(height: 100),
                          Padding(
                            padding: EdgeInsets.only(left: 8, bottom: 12),
                            child: Shim(height: 18, width: 45, radius: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
