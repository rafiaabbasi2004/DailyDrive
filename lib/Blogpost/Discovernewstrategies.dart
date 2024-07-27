import 'package:flutter/material.dart';

class DiscoverStrategies extends StatefulWidget {
  const DiscoverStrategies({super.key});

  @override
  State<DiscoverStrategies> createState() => _DiscoverStrategiesState();
}

class _DiscoverStrategiesState extends State<DiscoverStrategies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover New Strategies for Productivity',
          style: TextStyle(
            color: Colors.white,
          ),
            ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: const
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/Discover.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  ' Discover New Strategies for Productivity',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Productivity is the key to achieving more in less time. By implementing effective strategies, you can maximize your efficiency and output. Here are some innovative strategies to boost your productivity:',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Time Blocking:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Allocate specific blocks of time for different tasks throughout your day. This helps in maintaining focus and reducing the time spent switching between tasks.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '2. The Pomodoro Technique:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Work for 25 minutes, then take a 5-minute break. Repeat this cycle four times, and then take a longer break. This method helps maintain high levels of focus and reduces burnout.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '3. Prioritize Tasks:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Identify the most important tasks that need to be completed and tackle those first. This ensures that you are always working on high-impact activities.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '4. Set SMART Goals:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'SMART goals are Specific, Measurable, Achievable, Relevant, and Time-bound. Setting such goals helps in creating clear and achievable objectives, making it easier to stay on track.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '5. Minimize Distractions:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Identify common distractions and find ways to eliminate or reduce them. This might include turning off notifications, creating a dedicated workspace, or using noise-canceling headphones.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '6. Reflect and Adjust:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Regularly review your productivity strategies and assess their effectiveness. Be open to adjusting your approach based on what works best for you.',
                ),
                const SizedBox(height: 10),
                const Text(
                  'By implementing these strategies, you can enhance your productivity and achieve your goals more efficiently. Remember, productivity is a continuous journey of improvement and adaptation.',
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
