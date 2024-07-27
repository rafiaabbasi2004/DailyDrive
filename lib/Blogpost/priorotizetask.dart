import 'package:flutter/material.dart';

class Prioritize extends StatefulWidget {
  const Prioritize({super.key});

  @override
  State<Prioritize> createState() => _PrioritizeState();
}

class _PrioritizeState extends State<Prioritize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prioritize your tasks effectively',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.pink,

      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                    image: AssetImage(
                        'assets/prioritizeTask.png'
                    )),
                SizedBox(height: 20,),
                Text(
                    '        Why task prioritization matters',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,

                  ),
                  textAlign: TextAlign.center,
                    ),
                SizedBox(height: 10,),
                Text(
                  'Task prioritization is the process of determining the '
                      'most critical tasks and organizing a project timeline '
                      'accordingly. It helps you assess your projects and address '
                      'the most time-sensitive, high-priority tasks first.',
                  style: TextStyle(

                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 12,),
                Text('Here are top 6 ways to prioritize your tasks :',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 17,

                ),),

                SizedBox(height: 12,),
                Text('1. Collect a list of all your tasks :',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text('Pull together everything you could possibly consider getting done in a day. Don’t worry about the order or the number of items upfront. This will help you frame up how and when to allocate your time wisely.'
                  ,textAlign: TextAlign.justify,
                ),





                SizedBox(height: 10,),
                Text('2. Identify urgent vs. important :',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text('The next step is to see if you have any tasks that need '
                    'immediate attention. We’re talking about work that, '
                    'if not completed by the end of the day or in the next several '
                    'hours, will have serious negative consequences ',
                  textAlign: TextAlign.justify,),



                SizedBox(height: 10,),
                Text('3. Assess the value of your tasks :',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text('Take a look at your important work'
                    ' and identify what carries the highest value'
                    ' to your business and organization.'
                    ' As a general practice, you want to recognize '
                    'exactly which types of tasks are critical and '
                    'have top priority over the others.',
                  textAlign: TextAlign.justify,),




                SizedBox(height: 10,),
                Text('4. Order tasks by estimated effort :',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text('If you have tasks that seem to tie for priority standing, '
                    'check their estimates, and start on whichever one you think will'
                    ' take the most effort to complete. Productivity experts suggest '
                    'the tactic of starting the lengthier task first. But, if you feel '
                    'like you can’t focus on your meatier projects before you finish up'
                    ' the shorter task, then go with your gut and do that.',
                  textAlign: TextAlign.justify,),



                SizedBox(height: 10,),
                Text('5. Be flexible and adaptable :',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text('Uncertainty and change are given.'
                    ' Know that your priorities will change, '
                    'and often when you least expect them to.'
                    ' So plan for the unexpected. But—and here’s the trick—you '
                    'also want to stay focused on the tasks you’re committed to '
                    'completing. While working on such tasks, try to forecast other '
                    'project requirements that will follow your priorities so you can'
                    ' better prepare for what lies ahead',
                  textAlign: TextAlign.justify,

                ),



                SizedBox(height: 10,),
                Text('6. Know when to cut',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10,),
                Text('Be realistic. You probably can’t get to everything on your list.'
                    ' After you prioritize your tasks and look at your estimates,'
                    ' cut the remaining tasks from your list, and focus on the'
                    ' priorities that you know you must and can complete for the day.',
                  textAlign: TextAlign.justify,),

              ],
            ),
          ),
        ),
      )
    );
  }
}
