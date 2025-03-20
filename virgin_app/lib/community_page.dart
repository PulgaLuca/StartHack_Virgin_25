import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final Color virginRed = Color(0xFFE50914); // Virgin Red color

  // Total points and spent points
  final int totalPoints = 1000000; // Total community points
  final int spentPoints = 600000; // Points already spent

  final List<VotingProject> votingProjects = [
    VotingProject(
      title: 'Youngest, Cleanest Fleet in the Sky',
      description: 'The time for action against climate change is now. Virgin Atlantic are on a mission to achieve net-zero by 2050.',
      votes: 120,
    ),
    VotingProject(
      title: 'Pride \'n Purpose',
      description: 'Many communities surrounding Ulusaba lack basic needs such as access to clean drinking water, basic healthcare, food, childcare, and job opportunities.',
      votes: 95,
    ),
    VotingProject(
      title: 'Ocean Unite / ORRAA',
      description: 'The dual crises of climate change and mass wildlife extinctions threaten to forever change our world. By 2050, over 570 low-lying coastal cities will face threats from sea level rise and an estimated 800 million people will be at risk to storm surge and flooding from extreme weather events. The currents that swirl around Antarctica transport essential nutrients to other ocean currents that feed the rest of the world’s ocean. This vitally important region is on the frontline of the climate crisis.',
      votes: 80,
    ),
  ];

  // Function to handle voting
  void _voteForProject(int index) {
    setState(() {
      votingProjects[index].votes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light grey background
      appBar: AppBar(
        title: Text(
          'Community',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: virginRed, // Virgin Red AppBar
        elevation: 2,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner con messaggio di benvenuto
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    virginRed,
                    virginRed.withOpacity(0.8),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Join the Virgin community to make a difference!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Spend your points on projects that matter',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            
            // Rebuild the Forest Section
            _buildRebuildForestCard(context),
            
            SizedBox(height: 24),
            
            // Voting Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vote for Next Project',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: virginRed.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.how_to_vote, color: virginRed, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Vote now',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: virginRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 16),
            
            // Voting projects in scrollable horizontal list
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10), // Ridotto da 12 a 10
                itemCount: votingProjects.length,
                itemBuilder: (context, index) {
                  return _buildVotingCard(context, votingProjects[index], index);
                },
              ),
            ),
            
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Widget per il card "Rebuild the forest"
  Widget _buildRebuildForestCard(BuildContext context) {
    double spentPercentage = spentPoints / totalPoints; // Percentage of points spent

    return Card(
      elevation: 2,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner image with gradient
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage('assets/forest.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Protecting our Planet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Content section
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Celebrate the achievement of 1M virgin points globally spent this year with the "Protecting our Planet" project! Make the difference and engage with the community! Contrails, aircraft condensation trails, heighten the effect of global warming, which may account for more than half (57%) of the entire climate impact of aviation.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),
                // Points spent section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$spentPoints',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: virginRed,
                          ),
                        ),
                        Text(
                          'points spent',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$totalPoints',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'total points',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Progress Bar with Virgin Red color
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8 * spentPercentage,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: virginRed,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                // Progress percentage text
                Center(
                  child: Text(
                    '${(spentPercentage * 100).toStringAsFixed(0)}% of our goal achieved',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: virginRed,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Join project button
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Join This Project'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: virginRed,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget per costruire card di voto in stile Virgin
  Widget _buildVotingCard(BuildContext context, VotingProject project, int index) {
    return Container(
      width: 255, // Ridotto ulteriormente da 260 a 255
      margin: EdgeInsets.symmetric(horizontal: 6), // Ridotto da 8 a 6
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(12), // Ridotto da 14 a 12
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project icon (placeholder)
              Container(
                width: 36, // Ridotto da 40 a 36
                height: 36, // Ridotto da 40 a 36
                decoration: BoxDecoration(
                  color: virginRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getIconForProject(index),
                  color: virginRed,
                  size: 20, // Ridotto da 22 a 20
                ),
              ),
              SizedBox(height: 10), // Ridotto da 12 a 10
              // Project title
              Text(
                project.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 6),
              // Project description
              Text(
                project.description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              // Votes counter and vote button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people, size: 12, color: Colors.grey[700]),
                      SizedBox(width: 4),
                      Text(
                        '${project.votes} votes',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => _voteForProject(index),
                    child: Text('Vote'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: virginRed,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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

  // Helper per ottenere icone diverse per ogni progetto
  IconData _getIconForProject(int index) {
    List<IconData> icons = [
      Icons.airplanemode_active,
      Icons.nature_people,
      Icons.water_drop,
    ];
    
    return index < icons.length ? icons[index] : Icons.volunteer_activism;
  }
}

class VotingProject {
  final String title;
  final String description;
  int votes;

  VotingProject({
    required this.title,
    required this.description,
    this.votes = 0,
  });
}