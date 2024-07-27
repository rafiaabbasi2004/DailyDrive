import 'package:flutter/material.dart';

class BalanceWorkLife extends StatefulWidget {
  const BalanceWorkLife({super.key});

  @override
  State<BalanceWorkLife> createState() => _BalanceWorkLifeState();
}

class _BalanceWorkLifeState extends State<BalanceWorkLife> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ways to Balance Work and Personal Life',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/balance.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  ' Ways to Balance Work and Personal Life',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Balancing work and personal life is essential for maintaining overall well-being. Here are some effective ways to achieve a better work-life balance:',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Set Boundaries:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Clearly define your working hours and stick to them. Avoid working beyond your set hours to ensure you have time for personal activities and relaxation.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '2. Prioritize Tasks:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Focus on completing high-priority tasks during your work hours. This allows you to be more productive and frees up time for personal activities.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '3. Take Breaks:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Regular breaks during work can help you stay refreshed and maintain productivity. Use break times to relax and recharge.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '4. Unplug After Work:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Disconnect from work-related communications after your working hours. This helps you focus on personal time and prevents work from encroaching on your personal life.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '5. Schedule Personal Activities:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Plan and schedule personal activities just as you would with work tasks. This ensures that you allocate time for hobbies, family, and self-care.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '6. Communicate Effectively:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Keep open lines of communication with your employer and family. Let them know your boundaries and availability to ensure mutual understanding and support.',
                ),
                const SizedBox(height: 10),
                const Text(
                  '7. Practice Self-Care:',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Take care of your physical and mental health through regular exercise, a healthy diet, and adequate sleep. Self-care is crucial for maintaining balance.',
                ),
                const SizedBox(height: 10),
                const Text(
                  'By implementing these strategies, you can create a healthier balance between work and personal life, leading to increased happiness and productivity.',
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
