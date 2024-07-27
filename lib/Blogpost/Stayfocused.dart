import 'package:flutter/material.dart';

class StayFocused extends StatefulWidget {
  const StayFocused({super.key});

  @override
  State<StayFocused> createState() => _StayFocusedState();
}

class _StayFocusedState extends State<StayFocused> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Techniques to Stay Focused and Motivated',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/3rdone.png'),
                    ),
                    SizedBox(height: 20),
                    const Text(
                      ' Techniques to Stay Focused and Motivated',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Staying focused and motivated can be challenging, especially in today’s fast-paced world. Here are some effective techniques to help you stay on track:',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '1. Set Clear Goals:',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Having clear and achievable goals gives you a sense of direction and purpose. Break down larger goals into smaller, manageable tasks.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '2. Create a Routine:',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Establishing a daily routine can help you stay organized and maintain focus. Set specific times for work, breaks, and leisure activities.',
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '3. Eliminate Distractions:',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Identify what distracts you and find ways to minimize or remove these distractions. This could include turning off notifications or finding a quiet workspace.',
                      textAlign: TextAlign.justify,),
                    const SizedBox(height: 10),
                    const Text(
                      '4. Take Regular Breaks:',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Short breaks during work periods can help refresh your mind and maintain your focus. Try techniques like the Pomodoro Technique to balance work and breaks.',
                      textAlign: TextAlign.justify,),
                    const SizedBox(height: 10),
                    const Text(
                      '5. Stay Positive:',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Maintain a positive attitude and remind yourself of your achievements and progress. Positive reinforcement can boost your motivation and confidence.',
                      textAlign: TextAlign.justify,),
                    const SizedBox(height: 10),
                    const Text(
                      '6. Reward Yourself:',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Set up a reward system for completing tasks or reaching milestones. This can be a great motivator and something to look forward to.',
                      textAlign: TextAlign.justify, ),
                    const SizedBox(height: 10),
                    const Text(
                      'By applying these techniques, you can improve your focus and stay motivated to achieve your goals. Remember, consistency is key, and small steps lead to big achievements.',
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
