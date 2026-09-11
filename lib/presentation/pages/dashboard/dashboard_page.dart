import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/routes/app_routes.dart';
import '../../../state/app_state.dart';
import '../../widgets/activity_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.settings,
            );
          },
        ),
        title: const Text('Home Dashboard'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      appState.userName.isNotEmpty
                          ? appState.userName[0].toUpperCase()
                          : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ${appState.userName}',
                          style: theme.textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          appState.isDarkMode
                              ? 'Dark mode is on'
                              : 'Light mode is on',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                'Activities',
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 12),

              Expanded(
                child: ListView(
                  children: [
                    ActivityCard(
                      title: 'Activity One',
                      subtitle: 'Local counter demo',
                      icon: Icons.looks_one,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.activityOne,
                      ),
                    ),

                    const SizedBox(height: 16),

                    ActivityCard(
                      title: 'Activity Two',
                      subtitle: 'Local input demo',
                      icon: Icons.looks_two,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.activityTwo,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}