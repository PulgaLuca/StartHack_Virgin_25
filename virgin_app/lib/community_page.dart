import 'package:flutter/material.dart';
import 'home_page.dart';
import 'activity_page.dart';
import 'ticket_page.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final Color virginRed = Color(0xFFE50914); // Virgin Red color

  // Total points and spent points
  final int totalPoints = 1000000; // Total community points
  final int spentPoints = 600000; // Points already spent

  // List of projects to vote for - Testo abbreviato per Renewable Energy
  final List<VotingProject> votingProjects = [
    VotingProject(
      title: 'Urban Garden Initiative',
      description: 'Create green spaces in urban areas to promote sustainability.',
      votes: 120,
    ),
    VotingProject(
      title: 'Clean Water for All',
      description: 'Provide clean drinking water to underserved communities.',
      votes: 95,
    ),
    VotingProject(
      title: 'Renewable Energy',
      description: 'Install solar panels in rural areas for clean energy.',
      votes: 80,
    ),
  ];

  // Function to handle voting
  void _voteForProject(int index) {
    setState(() {
      votingProjects[index].votes++;
    });
  }

  // Metodo per gestire la navigazione
  void _onItemTapped(int index) {
    if (index == 0) {
      // Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      // Activity
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ActivityPage()),
      );
    } else if (index == 2) {
      // Tickets
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TicketsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // double spentPercentage = spentPoints / totalPoints; // Percentage of points spent

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
      // FAB per tornare alla home
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(0),
        backgroundColor: Colors.white,
        child: Icon(Icons.home, color: virginRed, size: 30),
        shape: CircleBorder(),
        tooltip: 'Home',
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: virginRed,
        clipBehavior: Clip.antiAlias,
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => _onItemTapped(1), // Activity page
              tooltip: 'Activity',
            ),
            IconButton(
              icon: Icon(Icons.confirmation_number, color: Colors.white),
              onPressed: () => _onItemTapped(2), // Tickets page
              tooltip: 'Tickets',
            ),
            SizedBox(width: 50), // Spazio per il FAB
            // Current page (Community) - highlighted
            IconButton(
              icon: Icon(Icons.groups, color: Colors.white),
              onPressed: () {}, // Già nella pagina Community
              tooltip: 'Community',
            ),
            IconButton(
              icon: Icon(Icons.military_tech, color: Colors.white),
              onPressed: () {}, // Achievements page (da implementare)
              tooltip: 'Achievements',
            ),
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
                'Rebuild the forest',
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
                  'Celebrate the achievement of 1M virgin points globally spent this year with the "Rebuild the forest" project! Make the difference and engage with the community!',
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
      Icons.nature_people,
      Icons.water_drop,
      Icons.solar_power,
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