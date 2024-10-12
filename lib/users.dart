class User {
  final String name;
  final int rank;
  final int score;

  User({required this.name, required this.rank, required this.score});
}

User user1 = User(name: 'Elchin', rank: 1, score: 100);
User user2 = User(name: 'Tamerlan', rank: 2, score: 90);
User user3 = User(name: 'Husein', rank: 3, score: 80);
User user4 = User(name: 'Eldar', rank: 4, score: 70);
User user5 = User(name: 'Elmar', rank: 5, score: 60);
User user6 = User(name: 'Elnur', rank: 6, score: 50);

List<User> users = [user1, user2, user3, user4, user5, user6];
