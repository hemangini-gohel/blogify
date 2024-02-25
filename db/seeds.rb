# We can create dynamic records with for loop but for proper data I've manually created records
user1 = User.create!(email: 'user1@example.com', password: 'password')
user2 = User.create!(email: 'user2@example.com', password: 'password')
user3 = User.create!(email: 'user3@example.com', password: 'password')

post1 = Post.create!(
  title: 'The Importance of Regular Exercise',
  user: user1,
  content: 'Regular exercise is essential for maintaining good physical and mental health.
  It helps in reducing the risk of chronic diseases such as heart disease, diabetes, and obesity.
  Additionally, exercise improves mood, boosts energy levels, and promotes better sleep.
  Incorporating a mix of cardiovascular, strength training,
  and flexibility exercises into your routine can lead to long-term health benefits.'
)

post2 = Post.create!(
  title: 'Tips for Effective Time Management',
  user: user2,
  content: 'Effective time management is crucial for maximizing productivity and reducing stress.
  Some tips for better time management include setting clear goals, prioritizing tasks, breaking tasks into smaller steps,
  using tools such as calendars and to-do lists, avoiding multitasking, and taking regular breaks. By managing your time effectively,
  you can accomplish more in less time and achieve a better work-life balance'
)

Post.create!(
  title: 'The Benefits of Mindfulness Meditation',
  user: user3,
  content: 'Mindfulness meditation has numerous benefits for both mental and physical well-being.
  It helps in reducing stress, anxiety, and depression by promoting relaxation and a sense of calm.
  Additionally, mindfulness meditation improves focus, attention, and emotional regulation.
  Practicing mindfulness regularly can lead to greater resilience and overall happiness'
)

Post.create!(
  title: 'Healthy Eating Habits for a Balanced Diet',
  user: user1,
  content: 'Maintaining healthy eating habits is essential for achieving a balanced diet and optimal nutrition.
  This includes consuming a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats.
  Portion control, mindful eating, and staying hydrated are also important aspects of a healthy diet.
  By making smart food choices and practicing moderation, you can support your overall health and well-being'
)

Post.create!(
  title: 'The Power of Positive Thinking',
  user: user2,
  content: 'Positive thinking can have a profound impact on mental and emotional health.
  It helps in reducing stress, improving mood, and fostering resilience in the face of challenges.
  By cultivating a positive mindset and practicing gratitude, individuals can enhance their overall happiness and well-being.
  Positive thinking also promotes better relationships, increased motivation, and greater success in achieving goals.'
)

Comment.create(
  content: 'Thank you for reading my post', user: user1, post: post1
)

Comment.create(
  content: 'Amazing Post', user: user2, post: post1
)

Comment.create(
  content: 'Good Blog', user: user3, post: post1
)

Comment.create(
  content: 'Thank you for reading my post', user: user2, post: post2
)

Comment.create(
  content: 'Amazing Post', user: user1, post: post2
)

Comment.create(
  content: 'Good Post', user: user3, post: post2
)
