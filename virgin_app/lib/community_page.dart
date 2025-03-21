import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}
// Classe Avatar globale riutilizzabile in tutte le pagine
class AvatarWidget extends StatelessWidget {
  final String imagePath; 
  final double size;
  final VoidCallback? onTap;

  const AvatarWidget({
    Key? key,
    this.imagePath = 'assets/profile_image.png', // Immagine di default dell'utente
    this.size = 40,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        // Mostra un menu o naviga al profilo
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Your Profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF58D68D), // Sfondo verde
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Sarah Rossi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('7,500 points'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE50914),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF58D68D), // Sfondo verde
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
class _CommunityPageState extends State<CommunityPage> {
  final Color virginRed = Color(0xFFE50914); // Virgin Red color

  // Total points and spent points
  final int totalPoints = 1000000; // Total community points
  final int spentPoints = 600000; // Points already spent

  final List<VotingProject> votingProjects = [
    VotingProject(
      title: 'Project CET',
      description: 'Project CETI is one of Virgin Unite\'s co-funded Audacious projects. It uses machine learning and robotics to translate sperm whale clicks in Dominica. By shedding light on the intricate and intelligent communication of whales, the project not only aims to accelerate conservation efforts, but has the potential to transform the way we understand our relationship with the natural world.',
      votes: 120,
      imagePath: 'assets/whale.jpg',
    ),
    VotingProject(
      title: 'Community Calling',
      description: 'A pioneering initiative by Virgin Media O2 that has already rehomed more than 20,000 unused smartphones with people who need them.',
      votes: 95,
      imagePath: 'assets/gift.jpg',
    ),
    VotingProject(
      title: 'Eve Branson Foundation',
      description: 'The Eve Branson Foundation is a small non-profit based in Morocco. Their mission is to create opportunities for local people in the High Atlas Mountains which can make a meaningful difference to their families and community. They have developed initiatives in four key areas: artisanal training, environment, healthcare and education.',
      votes: 80,
      imagePath: 'assets/community.jpg',
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Community',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          // Avatar in alto a destra
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AvatarWidget(
              imagePath: 'assets/mostro2_profilo.png',
            ),
          ),
        ],
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
            
            // Epic Sea Change For All Section
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
              height: 230, // Aumentata l'altezza per adattarsi alle card con immagini
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: votingProjects.length,
                itemBuilder: (context, index) {
                  return _buildVotingCardWithBanner(context, votingProjects[index], index);
                },
              ),
            ),
            
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Widget per il card "Epic Sea Change For All"
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
                image: AssetImage('assets/mangrove.jpg'),
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
                'Epic Sea Change For All',
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
                  'Virgin Voyages have teamed up with Virgin\'s Foundation, Virgin Unite, to support mangrove forest projects in the Caribbean. The aim is to accelerate nature-based solutions to climate change, and create a scalable model for other regions in the world.',
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

  // Nuovo widget per costruire card di voto con banner in stile Virgin
  Widget _buildVotingCardWithBanner(BuildContext context, VotingProject project, int index) {
    return Container(
      width: 280, // Allargata per fare spazio all'immagine
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image con titolo
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(project.imagePath),
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
                padding: EdgeInsets.all(12),
                alignment: Alignment.bottomLeft,
                child: Text(
                  project.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Contenuto
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: 12),
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
          ],
        ),
      ),
    );
  }

  // Widget per costruire card di voto originale (non più usato ma mantenuto per riferimento)
  Widget _buildVotingCard(BuildContext context, VotingProject project, int index) {
    return Container(
      width: 255,
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project icon (placeholder)
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: virginRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getIconForProject(index),
                  color: virginRed,
                  size: 20,
                ),
              ),
              SizedBox(height: 10),
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
      Icons.smartphone,
      Icons.water_drop,
    ];
    
    return index < icons.length ? icons[index] : Icons.volunteer_activism;
  }
}

class VotingProject {
  final String title;
  final String description;
  int votes;
  final String imagePath;

  VotingProject({
    required this.title,
    required this.description,
    this.votes = 0,
    required this.imagePath,
  });
}